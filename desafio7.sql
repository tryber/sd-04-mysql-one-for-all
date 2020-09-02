
CREATE VIEW perfil_artistas AS
SELECT a.artistas_name AS artista, al.album_name AS album, COUNT(s.id_artistas) AS seguidores 
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.album AS al
INNER JOIN SpotifyClone.seguindo_artistas AS s
WHERE a.artistas_id = al.id_artistas AND s.id_artistas = a.artistas_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;
