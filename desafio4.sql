USE SpotifyClone;

CREATE VIEW top_3_artistas AS
SELECT a.nome AS 'artista',
  (SELECT count(artistas_id) FROM SpotifyClone.artistas_seguidos
    WHERE artistas_id = a.id
  ) AS 'seguidores'
FROM SpotifyClone.artistas AS a
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
