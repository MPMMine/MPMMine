enum Skill = { UNSKILLED, SEMI_SKILLED, SKILLED };
int: M = 1*10^6;
int: T;                                               % Planning horizon
int: max_short_time;                                  % Max number of employees put on short-time working
int: max_retrain_unskilled;                           % Max number of employees that can be retrained from unskilled -> semi-skilled
int: max_overmanning;                                 % Max number of people that can be employed over the whole company
0.0..1.0: downgrade_dropout;                          % Fraction of workers leaving after downgrade
0.0..1.0: promotion_limit;                            % Max fraction of semi-skilled workers that can be promoted in the given year
0.0..1.0: short_time_efficiency;                      % Fraction of full time employee efficiency that meets a short-time employee
array[Skill] of int: init_strength;                   % Initial workforce
array[1..T, Skill] of int: req;                       % Future workforce
array[Skill] of 0.0..1.0: retention_existing;         % Complement rate of resignation
array[Skill] of 0.0..1.0: retention_new;              % Complement rate of resignation within the first year
array[Skill] of int: max_recruit;                     % Cap on additional recruitment
array[1..2] of int: retrain_cost;                     % Cost of retraining unskilled -> semi-skilled and semi-skilled -> skilled
array[Skill] of int: redundancy_cost;                 % Cost of declaring an employee redundant based on their skill
array[Skill] of int: overmanning_cost;                % Cost of superfluous employee based on their skill
array[Skill] of int: short_time_cost;                 % Cost of employee on short-time based on their skill

array[0..T, Skill] of var 0..M: t_strength;           % Workers employed in year i (at the end of the year)
array[1..T, Skill] of var 0..M: u_recruit;            % Recruitment in year i (at the begining of the year)
                                                      % Retraining
array[1..T] of var 0..max_retrain_unskilled: v_US_SS; % Unskilled -> Semi
array[1..T] of var 0..M: v_SS_SK;                     % Semi -> Skilled
                                                      % Downgrading
array[1..T] of var 0..M: v_SK_SS;                     % Skilled -> Semi
array[1..T] of var 0..M: v_SK_US;                     % Skilled -> Unskilled
array[1..T] of var 0..M: v_SS_US;                     % Semi -> Unskilled
array[1..T, Skill] of var 0..M: w_redundancy;         % Redundancy in year i
array[1..T, Skill] of var 0..max_short_time: x_short; % Short-time working in year i
array[1..T, Skill] of var 0..M: y_overmanning;        % Overmanning in year i


% Initial Conditions (Year 0)
constraint forall(s in Skill) (
    t_strength[0, s] = init_strength[s]
);

% Natural wastage and continuity
constraint forall(i in 1..T) (
    t_strength[i, SKILLED] = 
        retention_existing[SKILLED] * t_strength[i-1, SKILLED] % Existing skilled
      + retention_new[SKILLED] * u_recruit[i, SKILLED]         % New skilled recruits
      + retention_existing[SKILLED] * v_SS_SK[i]               % Existing workers retrained to be skilled can immediately leave
      - v_SK_SS[i]                                             % Downgrading to semi-skilled
      - v_SK_US[i]                                             % Downgrading to unskilled
      - w_redundancy[i, SKILLED]                               % redundant workers
);

constraint forall(i in 1..T) (
    t_strength[i, SEMI_SKILLED] = 
        retention_existing[SEMI_SKILLED] * t_strength[i-1, SEMI_SKILLED]
      + retention_new[SEMI_SKILLED] * u_recruit[i, SEMI_SKILLED]
      + retention_existing[SEMI_SKILLED] * v_US_SS[i]
      + (1 - downgrade_dropout) * v_SK_SS[i]                         % 'downgrade_dropout' fraction of demoted workers leave the company
      - v_SS_SK[i]                                             % these workers leave semi-skilled status to be skilled
      - v_SS_US[i]
      - w_redundancy[i, SEMI_SKILLED]
);

constraint forall(i in 1..T) (
    t_strength[i, UNSKILLED] = 
        retention_existing[UNSKILLED] * t_strength[i-1, UNSKILLED]
      + retention_new[UNSKILLED] * u_recruit[i, UNSKILLED]
      + (1 - downgrade_dropout) * v_SK_US[i]
      + (1 - downgrade_dropout) * v_SS_US[i]
      - v_US_SS[i]
      - w_redundancy[i, UNSKILLED]
);

% Upper bounds on recruitment
constraint forall(i in 1..T, s in Skill) (
    u_recruit[i, s] <= max_recruit[s]
);

% Retraining Semi-skilled Workers limit: vSS_SKi <= promotion_limit * tSKi
% The retraining of semi-skilled workers to
% make them skilled is limited to no more than `promotion_limit` fraction of the skilled labour
% force at the time as some training is done on the job.
constraint forall(i in 1..T) (
    v_SS_SK[i] <= promotion_limit * t_strength[i, SKILLED]
);

% Upper boounds on overmanning
constraint forall(i in 1..T) (
    sum(s in Skill)(y_overmanning[i, s]) <= max_overmanning
);

% Production Requirements Constraint: t_i - y_i - short_time_efficiency * x_i = req_i
% An employee on short-time working meets the production fraction of `short_time_efficiency` of a full-time employee
constraint forall(i in 1..T, s in Skill) (
    t_strength[i, s] - y_overmanning[i, s] - short_time_efficiency * x_short[i, s] = req[i, s]
);

var float: total_redundancy = sum(i in 1..T, s in Skill)(w_redundancy[i, s]);

solve minimize total_redundancy;


% var float: total_cost = sum(i in 1..T) (
%     retrain_cost[1] * v_US_SS[i]
%     + retrain_cost[2] * v_SS_SK[i]
%     + sum(s in Skill) (
%         redundancy_cost[s]  * w_redundancy[i, s]
%       + short_time_cost[s]  * x_short[i, s]
%       + overmanning_cost[s] * y_overmanning[i, s]
%     )
% );

% output [
%   "=================================================================================\n",
%   "                            MANPOWER PLANNING RESULTS                             \n",
%   "=================================================================================\n",
%   "Total Redundancy : ", show(total_redundancy), " workers\n",
%   "Total Cost       : £", show(total_cost), "\n",
%   "=================================================================================\n\n",

%   "--- RECRUITMENT ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, (u_recruit[y, UNSKILLED])) ++ "    " ++
%   show_int(10, (u_recruit[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, (u_recruit[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- RETRAINING AND DOWNGRADING ---\n",
%   "        Unskilled to   Semi-skilled   Semi-skilled   Skilled to     Skilled to\n",
%   "        semi-skilled   to skilled     to unskilled   unskilled      semi-skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, (v_US_SS[y])) ++ "       " ++
%   show_int(10, (v_SS_SK[y])) ++ "     " ++
%   show_int(10, (v_SS_US[y])) ++ "     " ++
%   show_int(10, (v_SK_US[y])) ++ "     " ++
%   show_int(12, (v_SK_SS[y])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- REDUNDANCY ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, (w_redundancy[y, UNSKILLED])) ++ "    " ++
%   show_int(10, (w_redundancy[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, (w_redundancy[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- SHORT-TIME WORKING ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, (x_short[y, UNSKILLED])) ++ "    " ++
%   show_int(10, (x_short[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, (x_short[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- OVERMANNING ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, (y_overmanning[y, UNSKILLED])) ++ "    " ++
%   show_int(10, (y_overmanning[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, (y_overmanning[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- WORKFORCE STRENGTH (START OF YEAR) ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n",
%   "Year 0   " ++
%   show_int(8, (t_strength[0, UNSKILLED])) ++ "    " ++
%   show_int(10, (t_strength[0, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, (t_strength[0, SKILLED])) ++ "\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, (t_strength[y, UNSKILLED])) ++ "    " ++
%   show_int(10, (t_strength[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, (t_strength[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ];