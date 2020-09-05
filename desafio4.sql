create view top_3_artistas as
select a.artista artistas, count(sa.idartista) seguidores
from artistas a
inner join seguindo_artista sa on sa.idartista = a.idartista
group by artistas
order by seguidores desc, artistas
limit 3;
