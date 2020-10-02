create view faturamento_atual
as select min(price_plan) as faturamento_minimo,
max(price_plan) as faturamento_maximo,
round(avg(price_plan),2) as faturamento_medio,
sum(price_plan) as faturamento_total
from user
inner join plan
on plan.plan_id = user.plan_id 
