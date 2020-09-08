CREATE VIEW top_3_artistas AS
  SELECT a.name AS artista, COUNT(fa.user) AS seguidores
  FROM artists AS a, favorite_artists AS fa
  WHERE a.id = fa.artist
  GROUP BY a.id
  ORDER BY COUNT(fa.user) DESC
  LIMIT 3;
