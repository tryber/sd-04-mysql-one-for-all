CREATE VIEW top_2_hits_do_momento AS
SELECT
  (
    SELECT
      nome
    FROM
      SpotifyClone.cancao
    WHERE
      id = SpotifyClone.playlist_history.cancao_id
  ) AS cancao,
  COUNT(cancao_id) AS seguidores
FROM
  playlist_history
GROUP BY
  cancao_id
order by
  seguidores DESC
LIMIT
  2
