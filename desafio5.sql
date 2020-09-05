create view top_2_hits_do_momento as
select c.cancao cancao, count(h.idcancao) reproducoes
from cancoes c
inner join historico h on h.idcancao = c.idcancao
group by cancao
order by reproducoes desc, cancao
limit 2;
