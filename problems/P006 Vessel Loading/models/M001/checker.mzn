int: deck_width;
int: deck_length;
int: n_containers;
int: n_classes;
array[int] of int: width;
array[int] of int: length;
array[int] of int: class;
array[int, int] of int: separation;
set of int: Containers = 1..n_containers;
array[Containers] of 0..deck_width: Left;
array[Containers] of 0..deck_width: Right;
array[Containers] of 0..deck_length: Bottom;
array[Containers] of 0..deck_length: Top;
array[Containers] of 1..2: orientation;

% To ensure common contract of the checker files we add those parameters as unused optionals. 
opt bool: check_objective;
opt float: obj_from_sol;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1: Boundaries and dimensions based on orientation
    [ check(
        let {
            array[1..2] of int: ElemWidth = [width[c], length[c]],
            array[1..2] of int: ElemLength = [length[c], width[c]]
        } in (
            Right[c] = Left[c] + ElemWidth[orientation[c]] /\
            Top[c] = Bottom[c] + ElemLength[orientation[c]]
        ),
        "Container " ++ show(c) ++ " has invalid coordinates for orientation " ++ 
        show(orientation[c]) ++ ". Box: [" ++ show(Left[c]) ++ ".." ++ show(Right[c]) ++ 
        ", " ++ show(Bottom[c]) ++ ".." ++ show(Top[c]) ++ "] given size " ++ 
        show(width[c]) ++ "x" ++ show(length[c]) ++ "."
    )
    | c in Containers ]
    ++
    % Check 2: Non-overlapping with class separation requirements
    [ check(
        Left[c] >= Right[k] + separation[class[c], class[k]] \/
        Right[c] + separation[class[c], class[k]] <= Left[k] \/
        Bottom[c] >= Top[k] + separation[class[c], class[k]] \/
        Top[c] + separation[class[c], class[k]] <= Bottom[k],
        let {
            % Calculate actual separation distance across all 4 directions
            int: actual_sep = max([
                Left[c] - Right[k],
                Left[k] - Right[c],
                Bottom[c] - Top[k],
                Bottom[k] - Top[c]
            ])
        } in
        "Separation violation between Container " ++ show(c) ++ " (Class " ++ show(class[c]) ++ 
        ") and Container " ++ show(k) ++ " (Class " ++ show(class[k]) ++ 
        "). Required separation: " ++ show(separation[class[c], class[k]]) ++ 
        ", Actual separation: " ++ show(actual_sep) ++ "."
    )
    | c, k in Containers where c < k ];

output [
  if forall(checks)
  then "CORRECT: all constraints hold.\n"
  else "INCORRECT: See error log above for specific violations.\n"
  endif
];