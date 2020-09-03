CREATE VIEW top_3_artistas AS
SELECT a.name AS artista,
  COUNT(f.user_id) AS seguidores
FROM Users_Following AS f
  JOIN Artists AS a ON a.id = f.artist_id
GROUP BY a.name
ORDER BY seguidores DESC,
  a.name ASC
LIMIT 3
