enum Skill = { UNSKILLED, SEMI_SKILLED, SKILLED };
int: T;                                               % Planning horison
array[Skill] of int: init_strength;                   % Initial workforce
array[1..T, Skill] of int: req;                       % Future workforce
array[Skill] of float: retention_existing;            % Rate of resignation
array[Skill] of float: retention_new;
array[Skill] of int: max_recruit;                     % Cap on additional recruitment
int: max_short_time;
int: max_retrain_unskilled;
int: max_overmanning;
array[1..2] of int: retrain_cost;
array[Skill] of int: redundancy_cost;
array[Skill] of int: overmanning_cost;
array[Skill] of int: short_time_cost;

array[0..T, Skill] of var 0..infinity: t_strength;    % Workers employed in year i
array[1..T, Skill] of var 0..infinity: u_recruit;     % Recruitment in year i
                                                      % Retraining
array[1..T] of var 0..max_retrain_unskilled: v_US_SS; % Unskilled -> Semi
array[1..T] of var 0..infinity: v_SS_SK;              % Semi -> Skilled
                                                      % Downgrading
array[1..T] of var 0..infinity: v_SK_SS;              % Skilled -> Semi
array[1..T] of var 0..infinity: v_SK_US;              % Skilled -> Unskilled
array[1..T] of var 0..infinity: v_SS_US;              % Semi -> Unskilled
array[1..T, Skill] of var 0..infinity: w_redundancy;  % Redundancy in year i
array[1..T, Skill] of var 0..max_short_time: x_short; % Short-time working in year i
array[1..T, Skill] of var 0..infinity: y_overmanning; % Overmanning in year i


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
      + 0.50 * v_SK_SS[i]                                      % fifty percent of downgraded workers leave the company
      - v_SS_SK[i]                                             % these workers leave semi-skilled status to be skilled
      - v_SS_US[i]
      - w_redundancy[i, SEMI_SKILLED]
);

constraint forall(i in 1..T) (
    t_strength[i, UNSKILLED] = 
        retention_existing[UNSKILLED] * t_strength[i-1, UNSKILLED]
      + retention_new[UNSKILLED] * u_recruit[i, UNSKILLED]
      + 0.50 * v_SK_US[i]
      + 0.50 * v_SS_US[i]
      - v_US_SS[i]
      - w_redundancy[i, UNSKILLED]
);

% Upper bounds on recruitment
constraint forall(i in 1..T, s in Skill) (
    u_recruit[i, s] <= max_recruit[s]
);

% Retraining Semi-skilled Workers limit: vSSSKi <= 0.25 * tSKi
% The retraining of semi-skilled workers to
% make them skilled is limited to no more than one quarter of the skilled labour
% force at the time as some training is done on the job.
constraint forall(i in 1..T) (
    v_SS_SK[i] <= 0.25 * t_strength[i, SKILLED]
);

% Upper boounds on overmanning
constraint forall(i in 1..T) (
    sum(s in Skill)(y_overmanning[i, s]) <= max_overmanning
);

% Production Requirements Constraint: t_i - y_i - 0.5*x_i = req_i
constraint forall(i in 1..T, s in Skill) (
    t_strength[i, s] - y_overmanning[i, s] - 0.5 * x_short[i, s] = req[i, s]
);

% constraint total_redundancy <= 843;

% constraint total_cost <= 508700;

var float: total_redundancy = sum(i in 1..T, s in Skill)(w_redundancy[i, s]);

var float: total_cost = sum(i in 1..T) (
    retrain_cost[1] * v_US_SS[i]                                + retrain_cost[2] * v_SS_SK[i]
    + redundancy_cost[UNSKILLED] * w_redundancy[i, UNSKILLED]   + redundancy_cost[SEMI_SKILLED] * w_redundancy[i, SEMI_SKILLED]   + redundancy_cost[SKILLED] * w_redundancy[i, SKILLED]
    + short_time_cost[UNSKILLED] * x_short[i, UNSKILLED]        + short_time_cost[SEMI_SKILLED] * x_short[i, SEMI_SKILLED]        + short_time_cost[SKILLED] * x_short[i, SKILLED]
    + overmanning_cost[UNSKILLED] * y_overmanning[i, UNSKILLED] + overmanning_cost[SEMI_SKILLED] * y_overmanning[i, SEMI_SKILLED] + overmanning_cost[SKILLED] * y_overmanning[i, SKILLED]
);


solve minimize total_redundancy;

% solve minimize total_cost;

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