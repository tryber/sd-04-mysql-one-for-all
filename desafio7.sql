CREATE VIEW perfil_artistas AS
SELECT
ar.artista AS `artista`,
al.album AS `album`,
COUNT(s.artista_id) AS `seguidores`
FROM artistas AS ar
INNER JOIN albuns AS al
ON ar.artista_id = al.artista_id
INNER JOIN artistas_seguidores AS s
ON ar.artista_id = s.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;
