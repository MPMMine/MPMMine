% Household power management
% Submitted by Tomasz P. Pawlak

% time periods for the planning horizon
set of int: periods;

% predicted consumption [kWh]
array[periods] of float: consumption;

% predicted production [kWh]
array[periods] of float: estimated_production;

% energy buy price per kWh
array[periods] of float: buy_price;

% energy sell price per kWh
array[periods] of float: sell_price;

% the safety margin for the excess consumption in the planning horizon
float: excess_consumption; % kWh
% the safety margin for the undersupply production in the planning horizon
float: undersupply_production; % kWh

% minimum/maximum/initial battery state of charge [kWh]
float: soc_min;
float: soc_max;
float: soc_initial;
float: soc_final; % at least
% battery charging and discharging efficiency - the output to input ratio
float: charge_efficiency;
float: discharge_efficiency;
float: store_efficiency; % between periods
float: charge_cost; % per kWh

% per period
float: shave_sell; % kWh
float: shave_charge; % kWh
float: shave_discharge; % kWh

% the total energy to buy/sell/charge/discharge in each period [kWh]
array[periods] of var 0.0..999.0: production;
array[periods] of var 0.0..999.0: buy;
array[periods] of var 0.0..shave_sell: sell;
array[periods] of var 0.0..shave_charge: charge;
array[periods] of var 0.0..shave_discharge: discharge;
% soc at the end of period
array[periods] of var soc_min..soc_max: soc; 

% monetary costs/earnings
array[periods] of var float: cost;
array[periods] of var float: earn;
var float: total_cost;
var float: total_earn;

% production limit
constraint forall (p in periods) ( 
  production[p] <= estimated_production[p]
);

% energy balance
constraint forall (p in periods) (
    consumption[p] + excess_consumption + charge[p] + sell[p] = production[p] - undersupply_production + discharge_efficiency * discharge[p] + buy[p]
  );

% exclusive choice between sell and buy
constraint forall (p in periods) (
    bool2int(sell[p] > 0) + bool2int(buy[p] > 0) <= 1
);

% exclusive choice between charge and discharge
constraint forall (p in periods) (
    bool2int(charge[p] > 0) + bool2int(discharge[p] > 0) <= 1
);

% battery soc  
constraint forall (p in periods) (
  let { var float: prev_soc = if p == min(periods) then soc_initial else soc[p-1] endif } in
  soc[p] = prev_soc * store_efficiency + charge_efficiency * charge[p] - discharge[p]
);

constraint 
  soc[max(periods)] >= soc_final;

% costs
constraint forall (p in periods) (
  cost[p] = buy_price[p] * buy[p] + charge_cost/charge_efficiency * charge[p]
);
constraint total_cost = sum (p in periods) (cost[p]);

% earnings
constraint forall (p in periods) (
  earn[p] = sell_price[p] * sell[p]
);
constraint total_earn = sum (p in periods) (earn[p]);

solve minimize total_cost - total_earn;

% Format as CSV
%output
%["total cost, \(total_cost), total earn, \(total_earn), total operating cost, \(total_cost - total_earn)\n"] ++
%["period, consumption, production, buy, sell, charge, discharge, soc, cost, earn\n"] ++
%["\(p), \(consumption[p]), \(production[p]), \(buy[p]), \(sell[p]), \(charge[p]), \(discharge[p]), \(soc[p]), \(cost[p]), \(earn[p])\n" | p in periods];
