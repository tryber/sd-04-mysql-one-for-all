create view faturamento_atual as
select min(p.valor_plano) faturamento_minimo, max(p.valor_plano) faturamento_maximo, round(avg(p.valor_plano), 2) faturamento_medio, sum(p.valor_plano) faturamento_total
from usuarios u
inner join planos p on p.idplano = u.idplano;
