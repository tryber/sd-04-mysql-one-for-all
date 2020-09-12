create view faturamento_atual as
select MIN(p.valor_plano) as faturamento_minimo,
MAX(p.valor_plano) as faturamento_maximo,
round(avg(p.valor_plano),2) as faturamento_medio,
sum(p.valor_plano) faturamento_total
from SpotifyClone.usuarios u
inner join SpotifyClone.planos p on p.plano_id=u.plano_id;
