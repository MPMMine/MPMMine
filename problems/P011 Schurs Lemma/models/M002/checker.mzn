int: boxes;
int: balls;
array[1..balls] of 1..boxes: box;
% To ensure common contract of the checker files we add those parameters as unused optionals. 
opt bool: check_objective;
opt float: obj_from_sol;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    [ check( 
        box[i] != box[j] \/
        box[i] != box[i+j] \/
        box[j] != box[i+j],
        "Box[i] ( " ++ show(box[i]) ++ " ), Box[j] ( " ++ show(box[j]) ++ " ), and Box[i+j] ( " ++ show(box[i+j]) ++ " ), are not all different"
    )
    | i in 1..balls-1, j in i+1 .. balls - i ];

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];