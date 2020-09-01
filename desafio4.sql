USE SpotifyClone;

CREATE VIEW top_3_artistas AS
SELECT ar.artist_name AS `artista`,
COUNT(DISTINCT f.user_id) AS `seguidores`
FROM artist AS ar
INNER JOIN followed_artist AS f
ON ar.artist_id = f.artist_id
GROUP BY `artista`
ORDER BY `seguidores` DESC,
`artista`
LIMIT 3;
