CREATE VIEW top_3_artistas
AS
  SELECT artista.nome AS artista, COUNT(ua.usuario_id) AS seguidores
  FROM SpotifyClone.artistas AS artista
    INNER JOIN usuarios_artistas AS ua 
  WHERE artista.id = ua.artista_id
  GROUP BY ua.artista_id
  ORDER BY seguidores DESC, artista
LIMIT 3;
