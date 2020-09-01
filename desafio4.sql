USE SpotifyClone;

CREATE VIEW top_3_artistas AS (
  SELECT
    a.nome AS artista,
    (
      SELECT
        count(*)
      FROM
        SpotifyClone.usuarios_artistas AS ua
      WHERE
        a.id = ua.artista_id
    )
  FROM
    SpotifyClone.artistas AS a
);
