int: n_classes;
int: n_options;
int: n_cars;
set of int: Classes = 1..n_classes;
set of int: Options = 1..n_options;
set of int: Slots = 1..n_cars;
array[Classes] of int: carQuantities;
array[Classes,Options] of int: optionsRequired;
array[Options] of int: blockSize;
array[Options] of int: maxCars;
array[Options] of int: numberOfCarsWithGivenOption = [sum(j in Classes) (carQuantities[j] * optionsRequired[j,i]) | i in Options];
array[Slots] of int: slot;
array[Options, Slots] of int: setup;

% To ensure common contract of the checker files we add those parameters as unused optionals. 
opt bool: check_objective;
opt float: obj_from_sol;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1: Ensures that the final sequence includes the correct number of cars of each class.
    [ check(
        sum(s in Slots) (bool2int(slot[s] = c)) = carQuantities[c], 
        "The number of cars " ++ show(sum(s in Slots) (slot[s] = c)) ++ " does not match the defined number of cars for class " ++ show(c) ++ " (" ++ show(carQuantities[c]) ++ ")")
    | c in Classes ]
    ++
    % Check 2: Each block of the assembly line can only accommodate a limited number of cars (blockSize).
    [ check(
        sum(j in s..s + blockSize[o] - 1) (setup[o,j]) <= maxCars[o],
        "The block (o, s - end) ( " ++ show(o) ++ ", " ++ show(s) ++ " - " ++ show(s + blockSize[o] - 1) ++ " ) is bigger than allowed block of " ++ show(maxCars[o]))
    | o in Options, s in 1..n_cars - blockSize[o] + 1 ]
    ++
    % Check 3: Check that setup reflects required features.
    [ check(
        forall(o in Options) (setup[o,s] = optionsRequired[slot[s],o]),
        "Slot " ++ show(s) ++ " (Class " ++ show(slot[s]) ++ ") has invalid options.\n" ++
        "  Expected row: " ++ show([ optionsRequired[slot[s], o] | o in Options ]) ++ "\n" ++
        "  Actual row:   " ++ show([ setup[o, s] | o in Options ])
      )
    | s in Slots ]
    ++
    % Check 4: The number of cars in a block must not exceed maxCars for the given option.
    [ check(
        sum(s in 1..(n_cars - i * blockSize[o])) (setup[o,s]) >= 
            (numberOfCarsWithGivenOption[o] - i * maxCars[o]),
        "Global sequencing bound violated for option " ++ show(o) ++ " at iteration " ++ show(i) ++ 
        ". Expected at least " ++ show(numberOfCarsWithGivenOption[o] - i * maxCars[o]) ++ 
        " options in slots 1.." ++ show(n_cars - i * blockSize[o]) ++ 
        " but found " ++ show(sum(s in 1..(n_cars - i * blockSize[o])) (setup[o,s])))
    | o in Options, i in 1..numberOfCarsWithGivenOption[o] ];

output [
  if forall(checks)
  then "CORRECT: all constraints hold.\n"
  else "INCORRECT: See error log above for specific violations.\n"
  endif
];