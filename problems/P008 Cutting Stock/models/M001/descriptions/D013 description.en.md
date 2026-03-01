# Window Frame Production Optimization

A manufacturing facility specializes in creating **aluminum sections for window frames**. Incoming aluminum extrusions
from the supplier are processed to produce pieces matching the specifications of customer orders.

Each supplier’s bar has a specific length, denoted as **L**. Customer requirements call for different sizes of frame
pieces. Each size type *i* requires a certain number of pieces of length **l_i**, with a total quantity demanded for
that size denoted as **d_i**.

Due to the cost of the aluminum, the facility strives to optimize its cutting strategy. Whenever a bar is cut, some
leftover material results, referred to as **scrap**.

The primary objective is to determine the optimal way to utilize the supplier bars to fulfill all customer orders,
minimizing the amount of material used. The goal is to establish a cutting program that satisfies the required
quantities of each frame type while minimizing waste and, consequently, production expenses.

[//]: # (Generated using gemma3:latest from D010 description.en.md and model.mzn; minor manual amendments applied)
