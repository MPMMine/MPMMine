enum Skill = { UNSKILLED, SEMI_SKILLED, SKILLED };
int: M = 1*10^6;
int: T;                                               % Planning horizon
int: max_short_time;                                  % Max number of employees put on short-time working
int: max_overmanning;                                 % Max number of people that can be employed over the whole company

0.0..1.0: downgrade_dropout;                          % Fraction of workers leaving after downgrade
0.0..1.0: short_time_efficiency;                      % Fraction of full time employee efficiency that meets a short-time employee

array[Skill] of int: init_strength;                   % Initial workforce
array[1..T, Skill] of int: req;                       % Future workforce requirements
array[Skill] of 0.0..1.0: retention_existing;         % Complement rate of resignation for existing staff
array[Skill] of 0.0..1.0: retention_new;              % Complement rate of resignation within first year
array[Skill] of int: max_recruit;                     % Cap on additional recruitment

% Unified transfer limit matrix (fractions relative to source/target workforce capacity)
% Rows: From skill level, Columns: To skill level
array[Skill, Skill] of 0.0..1.0: transfer_limit; 

array[Skill] of int: retrain_cost;                    % Cost of retraining from the indexed skill to level up
array[Skill] of int: redundancy_cost;                 % Cost of declaring an employee redundant based on skill
array[Skill] of int: overmanning_cost;                % Cost of superfluous employee based on skill
array[Skill] of int: short_time_cost;                 % Cost of employee on short-time based on skill

% Decision Variables
array[0..T, Skill] of var 0..M: t_strength;           % Workforce strength at end of year i
array[1..T, Skill] of var 0..M: u_recruit;            % Recruitment at start of year i
array[1..T, Skill, Skill] of var 0..M: transfer;      % Personnel transfer from s1 to s2 in year i
array[1..T, Skill] of var 0..M: w_redundancy;         % Redundancies in year i
array[1..T, Skill] of var 0..max_short_time: x_short; % Short-time workers in year i
array[1..T, Skill] of var 0..M: y_overmanning;        % Overmanning in year i


% Initial Conditions (Year 0)
constraint forall(s in Skill) (
    t_strength[0, s] = init_strength[s]
);

% Zero self-transfers (diagonal)
constraint forall(i in 1..T, s in Skill) (
    transfer[i, s, s] = 0
);

% Unified Natural Wastage and Workforce Continuity Constraint
constraint forall(i in 1..T, target in Skill) (
    t_strength[i, target] = 
        retention_existing[target] * t_strength[i-1, target]
      + retention_new[target] * u_recruit[i, target]
      
      % Incoming transfers from lower skills (Retraining/Promotion)
      + sum(source in Skill where source < target) (
            retention_existing[target] * transfer[i, source, target]
        )
        
      % Incoming transfers from higher skills (Downgrading)
      + sum(source in Skill where source > target) (
            (1.0 - downgrade_dropout) * transfer[i, source, target]
        )
        
      % Outgoing transfers to any other skill level
      - sum(dest in Skill where dest != target) (
            transfer[i, target, dest]
        )
        
      - w_redundancy[i, target]
);

% Upper bounds on recruitment
constraint forall(i in 1..T, s in Skill) (
    u_recruit[i, s] <= max_recruit[s]
);

% Unified Transfer / Promotion / Retraining Limits (Start-of-Year Capacity)
constraint forall(i in 1..T, s1 in Skill, s2 in Skill where s1 != s2) (
    if s1 < s2 then
        % Retraining limited by existing capacity at START of year (i - 1)
        transfer[i, s1, s2] <= transfer_limit[s1, s2] * t_strength[i - 1, s2]
    else
        % Demotion/downgrade limits relative to source workforce at START of year (i - 1)
        transfer[i, s1, s2] <= transfer_limit[s1, s2] * t_strength[i - 1, s1]
    endif
);

% Upper bounds on overall company overmanning per year
constraint forall(i in 1..T) (
    sum(s in Skill)(y_overmanning[i, s]) <= max_overmanning
);

% Production Requirements
constraint forall(i in 1..T, s in Skill) (
    t_strength[i, s] - y_overmanning[i, s] - short_time_efficiency * x_short[i, s] = req[i, s]
);

% Objective Definition
var float: total_cost = sum(i in 1..T) (
    retrain_cost[UNSKILLED] * transfer[i, UNSKILLED, SEMI_SKILLED] 
  + retrain_cost[SEMI_SKILLED] * transfer[i, SEMI_SKILLED, SKILLED]
  
  + sum(s in Skill) (
        redundancy_cost[s]  * w_redundancy[i, s]
      + short_time_cost[s]  * x_short[i, s]
      + overmanning_cost[s] * y_overmanning[i, s]
    )
);

solve minimize total_cost;

% var int: total_redundancy = sum(y in 1..T, s in Skill)(w_redundancy[y, s]);

% output [
%   "=================================================================================\n",
%   "                            MANPOWER PLANNING RESULTS                             \n",
%   "=================================================================================\n",
%   "Total Redundancy : ", show(total_redundancy), " workers\n",
%   "Total Cost       : £", show_int(0, fix(round(total_cost))), "\n",
%   "=================================================================================\n\n",

%   "--- RECRUITMENT ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, fix(u_recruit[y, UNSKILLED])) ++ "    " ++
%   show_int(10, fix(u_recruit[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, fix(u_recruit[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- TRANSFERS (RETRAINING & DOWNGRADING) ---\n",
%   "        Unskilled to   Semi-skilled   Semi-skilled   Skilled to     Skilled to\n",
%   "        semi-skilled   to skilled     to unskilled   unskilled      semi-skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, fix(transfer[y, UNSKILLED, SEMI_SKILLED])) ++ "       " ++
%   show_int(10, fix(transfer[y, SEMI_SKILLED, SKILLED])) ++ "     " ++
%   show_int(10, fix(transfer[y, SEMI_SKILLED, UNSKILLED])) ++ "     " ++
%   show_int(10, fix(transfer[y, SKILLED, UNSKILLED])) ++ "     " ++
%   show_int(12, fix(transfer[y, SKILLED, SEMI_SKILLED])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- REDUNDANCY ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, fix(w_redundancy[y, UNSKILLED])) ++ "    " ++
%   show_int(10, fix(w_redundancy[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, fix(w_redundancy[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- SHORT-TIME WORKING ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, fix(x_short[y, UNSKILLED])) ++ "    " ++
%   show_int(10, fix(x_short[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, fix(x_short[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- OVERMANNING ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, fix(y_overmanning[y, UNSKILLED])) ++ "    " ++
%   show_int(10, fix(y_overmanning[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, fix(y_overmanning[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ] ++ [

%   "\n--- WORKFORCE STRENGTH (END OF YEAR) ---\n",
%   "        Unskilled  Semi-skilled   Skilled\n",
%   "Year 0   " ++
%   show_int(8, fix(t_strength[0, UNSKILLED])) ++ "    " ++
%   show_int(10, fix(t_strength[0, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, fix(t_strength[0, SKILLED])) ++ "\n"
% ] ++ [
%   "Year " ++ show(y) ++ "   " ++
%   show_int(8, fix(t_strength[y, UNSKILLED])) ++ "    " ++
%   show_int(10, fix(t_strength[y, SEMI_SKILLED])) ++ "  " ++
%   show_int(8, fix(t_strength[y, SKILLED])) ++ "\n"
%   | y in 1..T
% ];