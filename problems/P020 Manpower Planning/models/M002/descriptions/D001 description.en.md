# Manpower Planning

A company is undergoing a number of changes that will affect its manpower requirements in future years. Owing to the installation of new machinery, fewer unskilled but more skilled and semi-skilled workers will be required. In addition to this, a downturn in trade is expected in the next year, which will reduce the need for workers in all categories. The estimated manpower requirements for the next three years are saved in the tables `init_strength` and `req`.

The company wishes to decide its policy with regard to the following over the next three years:
1. Recruitment
2. Retraining
3. Redundancy
4. Short-time working.

There is a natural wastage of labour. A fairly large number of workers leave during their first year. After this, the rate is much smaller. Taking this into account, the wastage rates can be found in the table `retention_existing` and `retention_new`.

There has been no recent recruitment and all workers in the current labour force have been employed for more than one year.

It is possible to recruit a limited number of workers from outside. In any one year, the numbers that can be recruited in each category are in the table `max_recruit`

It is possible to retrain up to `max_retrain_unskilled` unskilled workers per year to make them semi-skilled. The retraining of semi-skilled workers to make them skilled is limited to no more than one quarter of the skilled labour force at the time as some training is done on the job. Retraining costs are gathered in the `retrain_cost` table.

Downgrading of workers to a lower skill is possible but 50% of such workers leave, although it costs the company nothing. (This wastage is additional to the ‘natural wastage’ described above).

The redundancy payment are gathered in the `redundancy_cost` table.

It is possible to employ up to `max_overmanning` more workers over the whole company than are needed, but the extra costs per employee per year are gathered in `overmanning_cost` table.

Up to `max_short_time` workers in each category of skill can be put on short-time working. The cost of this (per employee per year) is gathered in the table `short_time_cost`.

An employee on short-time working meets the production requirements of half a full-time employee. The company’s declared objective is to minimise cost. How should they operate in order to do this?


[//]: # (Original problem form the book "Model Building in Mathematical Programming". Manually adjusted for the general case with redundancy minimization.)
