int: N;                     % number of candidate spheres
set of int: S = 1..N;
array[S] of float: r;       % radii of spheres

float: L;                   % side length of the cube

float: M = L*L;         % big-M constant


array[S] of var 0..L: x;
array[S] of var 0..L: y;
array[S] of var 0..L: z;

array[S] of var 0..1: use;  % 1 if sphere is packed


% Sphere must be fully inside the cube if used
constraint
  forall(i in S) (
    x[i] >= r[i] * use[i] /\
    y[i] >= r[i] * use[i] /\
    z[i] >= r[i] * use[i] /\
    x[i] <= L - r[i] * use[i] /\
    y[i] <= L - r[i] * use[i] /\
    z[i] <= L - r[i] * use[i]
  );

% Non-overlap constraints (relaxed if one sphere is not used)
constraint
  forall(i, j in S where i < j) (
    (x[i] - x[j]) * (x[i] - x[j]) +
    (y[i] - y[j]) * (y[i] - y[j]) +
    (z[i] - z[j]) * (z[i] - z[j])
    >=
    (r[i] + r[j]) * (r[i] + r[j])
    - M * (2 - use[i] - use[j])
  );
  
% At least one sphere must be in the cube
constraint 
  sum(use) >= 1;

solve maximize sum(i in S)(use[i]);

