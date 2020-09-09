create view estatisticas_musicais as 
SELECT COUNT(titulo) cancoes,
(SELECT COUNT(nome) artista FROM artista) artista,
(SELECT COUNT(titulo) album FROM album) album
FROM cancoes;
