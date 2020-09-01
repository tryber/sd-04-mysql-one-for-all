CREATE VIEW top_2_hits_do_momento AS
SELECT
  c.name AS cancao,
  count(*) AS reproducoes
FROM
  SpotifyClone.history AS h
  INNER JOIN SpotifyClone.songs AS c ON c.cancao_id = h.cancao_id
GROUP BY
  (h.cancao_id)
ORDER BY
  reproducoes DESC,
  cancao
LIMIT
  2;
