CREATE VIEW top_3_artistas AS
SELECT artist_name AS 'artista', (
SELECT COUNT(user_id) FROM SpotifyClone.following_artist
WHERE artist_id = SpotifyClone.artist.artist_id) AS 'seguidores'
FROM SpotifyClone.artist
ORDER BY 2 DESC, 1
LIMIT 3;
