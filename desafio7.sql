CREATE VIEW perfil_artistas AS
SELECT art.artist_name AS `artista`,
alb.album_name AS `album`,
COUNT(fol.artist_id) AS `seguidores`
FROM artist AS art
INNER JOIN album AS alb
ON art.artist_id = alb.artist_id
INNER JOIN followed_artist AS fol
ON fol.artist_id = alb.artist_id
GROUP BY artista, album
ORDER BY `seguidores` DESC, `artista`, `album`;
