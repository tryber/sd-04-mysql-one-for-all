CREATE VIEW perfil_artistas AS
SELECT
  art.nome AS artista,
  album.titulo AS album,
  COUNT(art_usr.usuario_id) AS seguidores
FROM SpotifyClone.artista_usuario AS art_usr
INNER JOIN SpotifyClone.artista AS art
ON art_usr.artista_id = art.artista_id
INNER JOIN SpotifyClone.album AS album
ON art.artista_id = album.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;
