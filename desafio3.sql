CREATE VIEW historico_reproducao_users AS
SELECT
  u.name AS usuario,
  c.name AS nome
FROM
  SpotifyClone.history AS h
  INNER JOIN SpotifyClone.users AS u ON u.user_id = h.user_id
  INNER JOIN SpotifyClone.songs AS c ON c.cancao_id = h.cancao_id
ORDER BY
  usuario,
  nome;
