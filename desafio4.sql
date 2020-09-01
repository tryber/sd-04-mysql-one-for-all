CREATE VIEW top_3_artistas AS
SELECT a.name AS artista,
  COUNT(f.user_id) AS seguidores
FROM users_following AS f
  JOIN artists AS a ON a.id = f.artist_id
GROUP BY a.name
ORDER BY seguidores DESC,
  a.name ASC
LIMIT 3
