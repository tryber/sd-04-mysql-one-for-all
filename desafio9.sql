CREATE PROCEDURE albuns_artist (nome VARCHAR(50))
SELECT (
SELECT artist_name FROM SpotifyClone.artist
WHERE artist_id = SpotifyClone.album.artist_id) AS 'artista',
album_name as 'album'
FROM SpotifyClone.album
HAVING artista = nome
ORDER BY 2;
