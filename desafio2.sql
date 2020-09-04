CREATE VIEW estatisticas_musicais as
select distinct count(c.idcancao) cancoes, count(distinct a.idartista) artistas, count(distinct al.album) albuns
from cancoes c
inner join artistas a on a.idartista = c.idartista
inner join albuns al on al.idartista = c.idartista;
