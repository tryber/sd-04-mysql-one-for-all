CREATE VIEW top_3_artistas AS
SELECT
  art.nome AS artista,
  COUNT(art_usr.artista_id) AS seguidores
FROM SpotifyClone.artista_usuario AS art_usr
INNER JOIN SpotifyClone.artista AS art
ON art_usr.artista_id = art.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
