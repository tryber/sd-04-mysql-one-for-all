CREATE VIEW top_3_artistas AS 
SELECT 
artista.nome AS `artista`,
COUNT(user_artista.usuario_id) AS `seguidores`
FROM artistas AS artista
INNER JOIN  usuarios_artistas AS user_artista WHERE artista.id = user_artista.artista_id
GROUP BY user_artista.artista_id
ORDER BY `seguidores` DESC, `artista` LIMIT 3;
