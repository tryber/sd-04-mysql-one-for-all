CREATE VIEW perfil_artistas AS
SELECT a.name AS artista,
  b.name AS album,
  COUNT(f.user_id) AS seguidores
FROM Users_Following AS f
  JOIN Artists AS a ON a.id = f.artist_id
  JOIN Albums AS b ON b.artist_id = a.id
GROUP BY b.name, a.name
ORDER BY seguidores DESC,
  artista ASC,
  album ASC
