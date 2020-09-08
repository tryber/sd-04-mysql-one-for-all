CREATE VIEW perfil_artistas AS
SELECT 
(SELECT name FROM SpotifyClone.artista WHERE artista_id = album.artista_id) AS artista,
album_name AS album,
(SELECT COUNT(artista_id) FROM SpotifyClone.seguindo WHERE seguindo.artista_id = album.artista_id) AS seguidores
FROM SpotifyClone.album
ORDER BY seguidores DESC, artista ASC, album ASC;
