CREATE VIEW top_3_artists AS
SELECT
  a.name AS artista,
  count(*) AS seguidores
FROM
  SpotifyClone.following AS s
  INNER JOIN SpotifyClone.artists AS a ON a.artist_id = s.artist_id
GROUP BY
  (a.artist_id)
ORDER BY
  seguidores DESC,
  artista
LIMIT
  3;
