% Car sequencing in MiniZinc.
%
% This is based on the OPL3 model car.mod.
%
% Compare with the Comet model
% http://www.hakank.org/comet/car.co
%
%
% This MiniZinc model was created by Hakan Kjellerstrand, hakank@bonetmail.com
% See also my MiniZinc page: http://www.hakank.org/minizinc
%
% Model modified to match CSPLib data format by Chris Mears.
%
% Modified by Rafał Stachowiak 2025
% === CHANGES MADE ===:
% - Remanmed the variables.
% - Added comments with exemplary data.
% - Split the constraints.
% - Removed custom output formatting.
%
% Licenced under CC-BY-4.0 : http://creativecommons.org/licenses/by/4.0/
%
% include "globals.mzn";
int: n_classes;                         % 22
int: n_options;                         % 5
int: n_cars;                            % 100
set of int: Classes = 1..n_classes;
set of int: Options = 1..n_options;
set of int: Slots = 1..n_cars;

% How many cars there are from each class
array[Classes] of int: carQuantities;   % [6, 10, 2, 2, 8, 15, 1, 5, 2, 3, 2, 1, 8, 3, 10, 4, 4, 2, 4, 6, 1, 1];

% Feature configuration for each car class
array[Classes,Options] of int: optionsRequired;

                                        % optionsRequired = [|1, 0, 0, 1, 0,
                                        %                 |1, 1, 1, 0, 0,
                                        %                 |1, 1, 0, 0, 1,
                                        %                 |0, 1, 1, 0, 0,
                                        %                 |0, 0, 0, 1, 0,
                                        %                 |0, 1, 0, 0, 0,
                                        %                 |0, 1, 1, 1, 0,
                                        %                 |0, 0, 1, 1, 0,
                                        %                 |1, 0, 1, 1, 0,
                                        %                 |0, 0, 1, 0, 0,
                                        %                 |1, 0, 1, 0, 0,  % <-- class 11 cars have features 1 and 3
                                        %                 |1, 1, 1, 0, 1,
                                        %                 |0, 1, 0, 1, 0,
                                        %                 |1, 0, 0, 1, 1,
                                        %                 |1, 0, 0, 0, 0,
                                        %                 |0, 1, 0, 0, 1,
                                        %                 |0, 0, 0, 0, 1,
                                        %                 |1, 0, 0, 0, 1,
                                        %                 |1, 1, 0, 0, 0,
                                        %                 |1, 1, 0, 1, 0,
                                        %                 |1, 0, 1, 0, 1,
                                        %                 |1, 1, 1, 1, 1|];

array[Options] of int: blockSize;       % [2, 3, 3, 5, 5];
array[Options] of int: maxCars;         % [1, 2, 1, 2, 1];

array[Options] of int: numberOfCarsWithGivenOption = [sum(j in Classes) (carQuantities[j] * optionsRequired[j,i]) | i in Options]; % [50, 54, 28, 40, 18]

% decision variables
array[Slots] of var Classes: slot;
array[Options, Slots] of var 0..1: setup;

% Example:

% slot = [14, 6, 1, 6, 2, 5, 3, 5, 2, 6, 1, 4, 1, 6, 2, 5, 3, 5, 2, 6, 1, 4, 18, 13, 2, 5, 19, 16, 8, 15, 13, 19, 17, 20, 6, 15, 8, 18, 13, 11, 6, 20, 17, 2, 13, 15, 5, 12, 6, 1, 6, 9, 16, 19, 8, 15, 13, 2, 17, 20, 10, 19, 6, 14, 7, 15, 6, 2, 5, 14, 6, 11, 6, 20, 5, 2, 16, 15, 8, 20, 6, 21, 6, 20, 8, 15, 17, 2, 13, 1, 10, 15, 16, 9, 13, 15, 10, 15, 13, 22];
% setup =
% [| 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
%  | 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1
%  | 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1
%  | 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1
%  | 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1
%  |];


% Ensures that the final sequence includes the correct number of cars of each class, as specified in carQuantities.
constraint forall(c in Classes) (
    sum(s in Slots) (bool2int(slot[s] = c)) = carQuantities[c]
);

% Each block of the assembly line can only accommodate a limited number of cars (blockSize). This constraint ensures that the production of cars with the same feature set respects this limit.
constraint forall(o in Options, s in 1..n_cars - blockSize[o] + 1) (
    sum(j in s..s + blockSize[o] - 1) (setup[o,j]) <= maxCars[o]
);

% Car classes require different combinations of features. The optionsRequired array defines which features are mandatory for each car class.
% To ensure that cars are built according to their class specifications, this constraint forces the setup variable to reflect these required features.
% The setup variable indicates whether a given feature is active in a slot. It must match the features required for the car class in that slot.
constraint forall(o in Options, s in Slots ) (
    setup[o,s] = optionsRequired[slot[s],o]
);

% The number of cars in a block must not exceed maxCars for the given option.
% Consequently if the production have scheduled a block (which is constrained via maxCars), the rest of the setup must produce not less than numberOfCarsWithGivenOption excluding number of cars in scheduled blocks.
constraint forall(o in Options, i in 1..numberOfCarsWithGivenOption[o]) (
    sum(s in 1..(n_cars - i * blockSize[o])) (setup[o,s]) >=
        (numberOfCarsWithGivenOption[o] - i * maxCars[o])
);

var int: z = sum(s in Classes) (s*slot[s]);
% solve minimize z;
solve satisfy;
