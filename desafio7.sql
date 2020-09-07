CREATE VIEW perfil_artistas AS
SELECT (
SELECT artist_name FROM SpotifyClone.artist
WHERE artist_id = SpotifyClone.album.artist_id) AS 'artista',
album_name AS 'album', (
SELECT COUNT(user_id) FROM SpotifyClone.following_artist
WHERE artist_id = SpotifyClone.album.artist_id) AS 'seguidores'
FROM SpotifyClone.album
ORDER BY 3 DESC, 1, 2;
