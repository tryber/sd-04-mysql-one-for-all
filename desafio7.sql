-- CREATE VIEW perfil_artistas AS
SELECT a.name AS artista,
  b.name AS album,
  COUNT(f.user_id) AS seguidores
FROM users_following AS f
  JOIN artists AS a ON a.id = f.artist_id
  JOIN albums AS b ON b.artist_id = a.id
GROUP BY album
ORDER BY seguidores DESC,
  artista ASC,
  album ASC
