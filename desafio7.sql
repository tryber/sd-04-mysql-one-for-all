CREATE VIEW perfil_artistas AS
SELECT ar.artist_name AS `artista`,
al.album_name AS `album`,
COUNT(fo.artist_id) AS `seguidores`
FROM SpotifyClone.artist AS ar
INNER JOIN SpotifyClone.album AS al
ON ar.artist_id = al.artist_id
INNER JOIN SpotifyClone.followed_artist AS fo
ON fo.artist_id = al.artist_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista`, `album`;
