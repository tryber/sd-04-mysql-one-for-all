CREATE VIEW perfil_artistas AS
  SELECT 
    art.name AS artista,
    alb.title AS album,
    COUNT(fa.user) AS seguidores
  FROM artists AS art, album AS alb, favorite_artists AS fa
  WHERE art.id = alb.artist AND art.id = fa.artist
  GROUP BY alb.id
  ORDER BY seguidores DESC, art.name, alb.title
