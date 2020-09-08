USE SpotifyClone;
CREATE VIEW top_3_artistas AS
  (SELECT a.nome AS artista, COUNT(s.artista_id) AS seguidores FROM SpotifyClone.artistas AS a
    INNER JOIN SpotifyClone.seguindo_artistas AS s
    ON a.id = s.artista_id
    GROUP BY s.artista_id
    ORDER BY seguidores DESC, artista
    LIMIT 3
);
