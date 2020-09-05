CREATE VIEW perfil_artistas AS (
  SELECT artistas.nome AS artista,
    albuns.album AS album,
    COUNT(sa.artista_id) AS seguidores
  FROM SpotifyClone.artistas AS artistas
    INNER JOIN SpotifyClone.albuns AS albuns ON artistas.artista_id = albuns.artista_id
    INNER JOIN SpotifyClone.seguindo_artistas AS sa ON artistas.artista_id = sa.artista_id
  GROUP BY albuns.album,
    artistas.nome
  ORDER BY seguidores DESC,
    artista,
    album
);
