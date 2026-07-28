enum DEPT;
enum CITY;

array[DEPT, CITY] of int: benefits;
array[DEPT, DEPT] of float: comm_quantity;
array[CITY, CITY] of int: comm_cost;

array[DEPT] of var CITY: loc;

% No city may host more than 3 departments
constraint forall(c in CITY) (
  sum(d in DEPT)(bool2int(loc[d] == c)) <= 3
);

var float: total_cost = 
  sum(i in DEPT, k in DEPT where i < k)(
    comm_quantity[i, k] * comm_cost[loc[i], loc[k]]
  ) 
  - sum(i in DEPT)(benefits[i, loc[i]]);

solve minimize total_cost;
