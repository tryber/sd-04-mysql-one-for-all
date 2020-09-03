CREATE VIEW top_3_artistas AS
SELECT artist_name `artista`, COUNT(user_id) `seguidores`
FROM artist ar
INNER JOIN following f WHERE ar.id = f.artist_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista` ASC LIMIT 3;
