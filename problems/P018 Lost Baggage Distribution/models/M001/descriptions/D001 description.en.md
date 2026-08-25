# Lost Baggage Distribution

A small company with `num_vans` vans has a contract with a number of airlines to
pick up lost or delayed baggage, belonging to customers in the London area,
from `X` airport at 6 p.m. each evening. The contract stipulates that each
customer must have their baggage delivered within `t_limit` minutes. The company requires
a model, which they can solve quickly each evening, to advise them what is
the minimum number of vans they need to use and to which customers each
van should deliver and in what order. There is no practical capacity limitation
on each van. All baggage that needs to be delivered in a time limit can
be accommodated in a van. Having ascertained the minimum number of vans
needed, a solution is then sought, which minimizes the maximum time taken by
any van.
On a particular evening, the places where deliveries need to be made and the
times to travel between them (in minutes) are given in the `dist_m` matrix.
No allowance is made for drop off times. For convenience, `X` will be regarded as the
first location.
Formulate optimization models that will minimize the number of vans that
need to be used, and within this minimum, minimize the time taken for the
longest time delivery.


[//]: # (Original problem form the book "Model Building in Mathematical Programming". Manually adjusted.)
