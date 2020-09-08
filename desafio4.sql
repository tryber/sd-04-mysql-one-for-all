CREATE VIEW top_3_artistas AS
SELECT an.artist_name AS `artista`,
COUNT(DISTINCT foll.user_id) AS `seguidores`
FROM artist AS an
INNER JOIN followed_artist AS foll
ON an.artist_id = foll.artist_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista` LIMIT 3;
