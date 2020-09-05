create view top_3_artistas as
select a.artista artista, count(sa.idartista) seguidores
from artistas a
inner join seguindo_artista sa on sa.idartista = a.idartista
group by artista
order by seguidores desc, artista
limit 3;
