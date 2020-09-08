CREATE VIEW perfil_artistas AS (
  SELECT ar.name AS artista,
    al.name AS album,
    COUNT(f.follow_id) AS seguidores
  FROM SpotifyClone.artists as ar
    INNER JOIN SpotifyClone.albuns AS al ON al.artist = ar.artist_id
    INNER JOIN SpotifyClone.followers AS f ON f.artist = ar.artist_id
  GROUP BY ar.name, al.name
  ORDER BY seguidores DESC,ar.name, al.name
);
