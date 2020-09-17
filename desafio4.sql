CREATE VIEW top_3_artistas AS (
  SELECT artistas.artista_nome AS artista,
  (
    SELECT COUNT(*) FROM seguindo
    WHERE (seguindo.artista_id = artistas.artista_id)
  ) AS seguidores
  FROM artistas AS artistas
  ORDER BY seguidores DESC, artista
  LIMIT 3
);
