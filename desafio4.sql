CREATE VIEW top_3_artistas AS
  SELECT
    a.nome artista,
    COUNT(*) seguidores
  FROM
    SpotifyClone.artistas a,
    SpotifyClone.usuarios_seguindo_artistas usa
  WHERE
    a.id = usa.artistas_id
  GROUP BY
    artista
  ORDER BY
    seguidores DESC,
    artista
  LIMIT
    3;
