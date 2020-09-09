create view estatisticas_musicais as 
SELECT COUNT(titulo) cancoes,
(SELECT COUNT(nome) artista FROM artista) artistas,
(SELECT COUNT(titulo) album FROM album) albuns
FROM cancoes;
