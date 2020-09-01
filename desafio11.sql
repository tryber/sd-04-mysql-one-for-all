CREATE VIEW cancoes_premium AS
SELECT
  c.name AS name,
  count(*) AS reproducoes
FROM
  SpotifyClone.history AS hr
  INNER JOIN SpotifyClone.songs AS c ON hr.cancao_id = c.cancao_id
  INNER JOIN SpotifyClone.users AS u ON hr.user_id = u.user_id
WHERE
  u.plano_id > 1
GROUP BY
  (hr.cancao_id)
ORDER BY
  name;
