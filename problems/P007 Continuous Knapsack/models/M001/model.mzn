int: n;
set of int: OBJ = 1..n;
int: capacity;
array[OBJ] of int: profit;
array[OBJ] of int: size;

array[OBJ] of var 0.0..1.0: x;

constraint sum(i in OBJ)(size[i] * x[i]) <= capacity;

solve maximize sum(i in OBJ)(profit[i] * x[i]);