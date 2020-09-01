CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT s.song_id) AS `cancoes`,
COUNT(DISTINCT ar.artist_id) AS `artistas`,
COUNT(DISTINCT al.album_id) AS `albuns`
FROM SpotifyClone.artist AS ar
INNER JOIN SpotifyClone.album AS al
ON ar.artist_id = al.artist_id
INNER JOIN SpotifyClone.song AS s
ON al.album_id = s.album_id;    
