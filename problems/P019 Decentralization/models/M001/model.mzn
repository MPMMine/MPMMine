enum DEPT;
enum CITY;

int: max_dept;

array[DEPT, CITY] of int: benefits;
array[DEPT, DEPT] of float: comm_quantity;
array[CITY, CITY] of int: comm_cost;

array[DEPT] of var CITY: loc;

% No city may host more than `max_dept` departments
constraint forall(c in CITY) (
  sum(d in DEPT)(bool2int(loc[d] == c)) <= max_dept
);

var float: total_cost ::no_output = 
  sum(i in DEPT, k in DEPT where i < k)(
    comm_quantity[i, k] * comm_cost[loc[i], loc[k]]
  ) 
  - sum(i in DEPT)(benefits[i, loc[i]]);

solve minimize total_cost;
