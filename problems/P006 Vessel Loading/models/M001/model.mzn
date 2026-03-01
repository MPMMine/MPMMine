% prob008.mzn: Vessel Loading
% Problem details available at
% http://www.csplib.org/Problems/prob008/
% Source: https://www.csplib.org/Problems/prob008/models/vessel-loading.mzn.html
% Author: Frej Knutar Lewander

% Modified by Rafał Stachowiak 2025
% === CHANGES MADE ===:
% - Removed custom output
% - Added `solve satisfy`;
 
int: deck_width; % width of deck
int: deck_length; % height of deck
int: n_containers; % number of containers
int: n_classes; % number of container classes
 
array[int] of int: width;
% width[c] = width of container c
array[int] of int: length;
% length[c] = length of container c
array[int] of int: class;
% class[c] = class of container c
array[int, int] of int: separation;
% separation[a, b] = the minimum allowed separation between
%                    containers of classes a and b
 
set of int: Containers = 1..n_containers;
 
array[Containers] of var 0..deck_width: Left;
% Left[c] = leftmost point of container c
array[Containers] of var 0..deck_width: Right;
% Right[c] = rightmost point of container c
array[Containers] of var 0..deck_length: Bottom;
% Bottom[c] = bottommost point of container c
array[Containers] of var 0..deck_length: Top;
% Top[c] = topmost point of container c
 
array[Containers] of var 1..2: orientation;
% orientation[c] = 2 if container c is turned 90 degrees, else 1.
 
constraint
  forall (c in Containers) (
    let {
      array[1..2] of int: ElemWidth = [width[c], length[c]];
      array[1..2] of int: ElemLength = [length[c], width[c]]
    }
    in
      Right[c] = Left[c] + ElemWidth[orientation[c]] /\
      Top[c] = Bottom[c] + ElemLength[orientation[c]]
  )
;
 
constraint
  forall(c, k in Containers where c < k) (
    Left[c] >= Right[k] + separation[class[c], class[k]] \/
    Right[c] + separation[class[c], class[k]] <= Left[k] \/
    Bottom[c] >= Top[k] + separation[class[c], class[k]] \/
    Top[c] + separation[class[c], class[k]] <= Bottom[k]
  )
;

solve satisfy;