CREATE VIEW top_3_artistas AS
SELECT nome_artista AS artista, COUNT(usuario_id) AS seguidores
FROM artista_seguidores AS se
INNER JOIN artistas a ON se.artista_id = a.id_artista
GROUP BY artista
ORDER BY seguidores DESC
LIMIT 3;
