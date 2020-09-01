CREATE VIEW top_3_artistas AS
  (SELECT a.nome AS artista, COUNT(sa.artista_id) AS seguidores FROM SpotifyClone.artistas AS a
    INNER JOIN SpotifyClone.seguindo_artistas AS sa
    ON a.id = sa.artista_id
    GROUP BY sa.artista_id
    ORDER BY seguidores DESC, artista
    LIMIT 3
);
