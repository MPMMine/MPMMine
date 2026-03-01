% model from https://github.com/athanor/athanor-experiments/blob/master/models/minizinc/ppp.mzn
% Modified by Rafał Stachowiak 2025
% === CHANGES MADE ===:
% - Removed including unnecessary "alldifferent.mzn" library.
% - Added inline comments. 
% - Changed the names of variables in the third constraint.
% - Uncommented the symmetry breaking constraints.


include "globals.mzn";

int: n_boats; % 14
int: n_periods; % 5

set of int : Boat = 1..n_boats;
set of int : Time = 1..n_periods;

array [Boat] of int : capacity; % [6, 8, 12, 12, 12, 12, 12, 10, 10, 10, 10, 10, 8, 8]
array [Boat] of int : crew;     % [2, 2, 2,  2,  4,  4,  4,  1,  2,  2,  2,  3,  4, 2]

var set of Boat : hosts;
array [Boat, Time] of var Boat : visit;

% Example:
% hosts = {1,2,5,6,7};
% visit =
% [| 1, 1, 1, 1, 1 % HOST
%  | 2, 2, 2, 2, 2
%  | 1, 2, 5, 6, 7 % Boat 3 visits boat 1, 2, 5, 6, 7 and meets: in boat 1 boat 10, in boat 2 boat 11, ...
%  | 6, 5, 7, 2, 1
%  | 5, 5, 5, 5, 5
%  | 6, 6, 6, 6, 6
%  | 7, 7, 7, 7, 7
%  | 6, 1, 2, 7, 5
%  | 7, 6, 2, 5, 1
%  | 1, 7, 6, 5, 2
%  | 7, 2, 6, 1, 5
%  | 5, 1, 6, 2, 7
%  | 2, 5, 1, 7, 6
%  | 5, 7, 2, 1, 6
%  |];

% the values in visit table must be hosts
constraint forall(b in Boat, t in Time) (
  visit[b,t] in hosts
);

% hosts visit themselves all the time
constraint forall(b in Boat, t in Time) (
  (b in hosts) <-> visit[b,t]=b
);

% all guest boats crews + host crew <= capacity of the host
constraint forall(h in hosts, t in Time) (
  sum(b in Boat)(
    bool2int(visit[b,t]=h)*crew[b]
  ) <= capacity[h]
);

% no two crews (host as well as guest) are at the same party more than once
constraint forall (k,l in Boat where k<l)(
  sum(t in Time)(
    bool2int(visit[k,t]=visit[l,t])
  ) <= 1
);

%%%% SYMMETRY BREAKING %%%
constraint forall(i in 1..n_periods-1)(
  lex_lesseq(visit[..,i], visit[..,i+1]) % Lexicographic ordering of rows in visit
);

var int : optVar;
constraint optVar=card(hosts);

solve minimize optVar;