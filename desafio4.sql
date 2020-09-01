CREATE VIEW top_3_artistas AS
SELECT
(
SELECT
nome_artista
FROM SpotifyClone.artista AS a
WHERE a.id_artista = f.id_artista
) AS artista,
COUNT(id_artista) AS seguidores
FROM SpotifyClone.artista_usuario AS f
GROUP BY id_artista
ORDER BY seguidores DESC, artista
LIMIT 3;
