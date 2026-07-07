include "globals.mzn";

int: n_boats;
int: n_periods;

set of int : Boat = 1..n_boats;
set of int : Time = 1..n_periods;

array [Boat] of int : capacity;
array [Boat] of int : crew;

set of int : hosts;
array [Boat, Time] of int : visit;
int: optVar;

% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
float: obj_from_sol;
float: eps = 1e-6; 

test check(bool: b, string: s) =
  if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
  % Check 1: Hosts range
  [ check(
      visit[b,t] in hosts, 
      "visit[" ++ show(b) ++ "," ++ show(t) ++ "] (" ++ show(visit[b,t]) ++ ") is not in hosts.") 
  | b in Boat, t in Time ]
  ++
  % Check 2: Self-visiting
  [ check(
      (b in hosts) <-> visit[b,t]=b, 
      "Host logic failed for boat " ++ show(b) ++ " at time " ++ show(t)) 
  | b in Boat, t in Time ]
  ++
  % Check 3: Capacity
  [ check(
      sum(b in Boat)(bool2int(visit[b,t]=h)*crew[b]) <= capacity[h], 
      "Capacity exceeded for host " ++ show(h) ++ " at time " ++ show(t) ++ 
      " (Total crew: " ++ show(sum(b in Boat)(bool2int(visit[b,t]=h)*crew[b])) ++ ", Capacity: " ++ show(capacity[h]) ++ ")"
    ) 
  | h in hosts, t in Time ]
  ++
  % Check 4: Socializing / Meeting more than once
  [ check(
      sum(t in Time)(bool2int(visit[k,t]=visit[l,t])) <= 1,
      "Boats " ++ show(k) ++ " and " ++ show(l) ++ " met too many times. Mutual places: " ++ 
      show([ (t, visit[k,t]) | t in Time where visit[k,t] = visit[l,t] ])
    )
  | k,l in Boat where k<l ]
  ++
  % Check 5: Objective
  [ check(
      optVar=card(hosts), 
      "Objective value is calculated erronously: optVar=" ++ show(optVar) ++ ", card(hosts)=" ++ show(card(hosts)))
  ]
  ++
  % Check 6: Symmetry breaking
  [ check(
      lex_lesseq(col(visit, i), col(visit, i+1)),
      "Symmetry breaking failed between Period " ++ show(i) ++ " and Period " ++ show(i+1) ++ ".\n" ++
      "  Mismatch found at Boat index: " ++ show([ r | r in Boat where col(visit, i)[r] != col(visit, i+1)[r] ]) ++ "\n" ++
      "  Period " ++ show(i)   ++ ": " ++ show(col(visit, i)) ++ "\n" ++
      "  Period " ++ show(i+1) ++ ": " ++ show(col(visit, i+1))
    )
  | i in 1..n_periods-1 ]
  ++
  % Conditionally append the objective check inline
  if check_objective then 
    [ check(
        int2float(optVar) >= obj_from_sol - eps /\ int2float(optVar) <= obj_from_sol + eps,
        "The objective: " ++ show(optVar) ++ " does not match the objective from the solution file: " ++ show(obj_from_sol)
      ) ]
  else 
    [] 
  endif;

output [
  if forall(checks)
  then "CORRECT: all constraints hold.\n"
  else "INCORRECT: See error log above for specific violations.\n"
  endif
];