CREATE VIEW historico_reproducao_usuarios AS
SELECT
  u.nome AS 'usuario',
  c.titulo AS 'nome'
FROM
  SpotifyClone.usuario AS u
  INNER JOIN SpotifyClone.historico_reproducao_usuarios AS h ON u.id = h.usuario_id
  INNER JOIN SpotifyClone.cancoes AS c ON c.id = h.cancoes_id
ORDER BY
  `usuario`,
  `nome`;
