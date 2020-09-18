CREATE VIEW perfil_artistas AS(
  SELECT
    DISTINCT artistas.artista_nome AS artista,
    albuns.album_nome AS album,
    (
      SELECT
        COUNT(*)
      FROM
        seguindo
      WHERE
        (seguindo.artista_id = artistas.artista_id)
    ) AS seguidores
  FROM
    SpotifyClone.artistas AS artistas
    INNER JOIN SpotifyClone.albuns AS albuns ON (albuns.artista_id = artistas.artista_id)
    INNER JOIN SpotifyClone.seguindo AS seguindo ON (seguindo.artista_id = artistas.artista_id)
  ORDER BY
    seguidores DESC,
    artista,
    album
);
