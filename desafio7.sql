-- USE SpotifyClone;
-- DROP VIEW IF EXISTS perfil_artistas;
CREATE VIEW perfil_artistas AS (
  SELECT
    DISTINCT artistas.nome AS artista,
    albuns.nome AS album,
    (
      SELECT
        count(*)
      FROM
        SpotifyClone.usuarios_artistas AS ua
      WHERE
        artistas.id = ua.artista_id
    ) AS seguidores
  FROM
    SpotifyClone.artistas
    INNER JOIN SpotifyClone.albuns ON (albuns.artista_id = artistas.id)
    INNER JOIN SpotifyClone.usuarios_artistas AS ua ON (ua.artista_id = artistas.id)
  ORDER BY
    seguidores DESC,
    artista,
    album
);
