CREATE VIEW perfil_artistas AS
  SELECT
    a.nome artista,
    al.nome album,
    COUNT(usa.usuarios_id) seguidores
  FROM
    SpotifyClone.usuarios_seguindo_artistas usa
  INNER JOIN
    SpotifyClone.artistas a ON
    a.id = usa.artistas_id
  INNER JOIN
    SpotifyClone.albuns al ON
    al.artistas_id = a.id
  GROUP BY
    artista,
    album
  ORDER BY
    seguidores DESC,
    artista,
    album;
