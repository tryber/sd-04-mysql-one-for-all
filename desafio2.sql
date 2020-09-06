CREATE VIEW estatisticas_musicais AS
SELECT COUNT(track_id) AS 'cancoes',
COUNT(DISTINCT artist_name) AS 'artistas',
COUNT(DISTINCT album_name) AS 'albuns'
FROM SpotifyClone.track
INNER JOIN album
ON album.album_id = track.album_id
INNER JOIN artist
ON artist.artist_id = album.artist_id;
