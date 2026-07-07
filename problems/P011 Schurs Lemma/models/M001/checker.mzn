include "globals.mzn";

int: n; 
int: max_k = floor((exp(1) - 1.0/6.0) * product(i in 1..n)(int2float(i))); 
int: k;
array[1..max_k] of 1..n: x;
% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
float: obj_from_sol;
float: eps = 1e-6; 


test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

%% Inspiration taken from https://github.com/MiniZinc/libminizinc/blob/master/share/minizinc/std/fzn_seq_precede_chain_int.mzn
function bool: par_seq_precede_chain_int(array [int] of int: X) =
  if length(X) == 0 then
    true
  else
    let {
      int: l = min(X); 
      int: u = max(X); 
      int: f = min(index_set(X));
      % Because H can no longer rely on a solver to lazily deduce its values, we explicitly compute the library's recurrence relation (Hi​=max(Xi​,Hi−1​)). 
      % The inner slice max([X[j] | j in f..i-1]) replicates exactly what the value of Hi−1​ would be by looking at the maximum element found in X from the starting index f up to the previous position.
      array [index_set(X)] of l..u: H = [
        if i == f then max(X[f], 0) else max(X[i], max([X[j] | j in f..i-1])) endif
        | i in index_set(X)
      ];
    } in 
    % In the original let-in block, those statements were active structural constraints (=) acting on variables. 
    % In our pure boolean function context, we are performing assertion comparisons, which require ==. 
    % The /\ and forall operators seamlessly transition because MiniZinc overloads them to evaluate mathematically when all inputs are concrete bool parameters.
      H[f] <= 1 /\
      H[f] == max(X[f], 0) /\
      forall (i in index_set(X) diff {f}) (
        H[i] <= H[i - 1] + 1 /\ H[i] == max(X[i], H[i - 1])
      )
  endif;

%% inspiration taken from https://github.com/MiniZinc/libminizinc/blob/master/share/minizinc/std/fzn_value_precede_chain_int.mzn
function bool: par_value_precede_chain_int(array [int] of int: T, array [int] of int: X) = 
   if length(T) == 0 then 
     true 
   elseif min(index_set(T)) == 1 /\ 
     forall (i in index_set(T)) (T[i] == i) /\ 
      max(T) == max(X) then 
     par_seq_precede_chain_int(X) 
   else 
     let { 
       int: offset = min(index_set(T)) - 1; 
       int: l = min(X); 
       int: u = max(X); 
       array [1..u - l + 1] of int: p = [ 
         sum([i - offset | i in index_set(T) where T[i] == j]) | 
           j in l..u
       ]; 
       array [int] of int: Y = [p[X[i] - l + 1] | i in index_set(X)]; 
     } in par_seq_precede_chain_int(Y) 
   endif; 


array[int] of bool: checks = 
    % Check 1 & 2: Boundary conditions
    [ check(k >= 1, "Schur number k = " ++ show(k) ++ " is invalid. It must be >= 1.") ]
    ++
    [ check(k <= max_k, "Schur number k = " ++ show(k) ++ " exceeds max bound " ++ show(max_k) ++ ".") ]
    ++
    % Check 3: Sum-Free Constraint
    [ check(
        (x[i] == x[j] /\ x[i+j] == x[i]) -> i+j > k,
        "Sum-free violation: Elements " ++ show(i) ++ " and " ++ show(j) ++ " sum up to " ++ show(i+j) ++ ", sharing partition " ++ show(x[i]) ++ "."
      )
    | i in 1..max_k-1, j in i..max_k-i ]
    ++
    % Check 4: Symmetry Breaking Constraint utilizing the exact library conversion rules
    [ check(
        par_value_precede_chain_int([i | i in 1..n], x),
        "Symmetry breaking failed: Value precedence order (1.." ++ show(n) ++ ") is broken."
      ) ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
        [ check(
            k >= obj_from_sol - eps /\ k <= obj_from_sol + eps,
            "The objective: " ++ show(k) ++ " does not match the objective from the solution file: " ++ show(obj_from_sol)
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