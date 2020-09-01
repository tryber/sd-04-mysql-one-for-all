USE SpotifyClone;

DROP VIEW IF EXISTS historico_repoducao_usuarios;

CREATE VIEW historico_reproducao_usuarios AS
SELECT
  u.nome AS usuario,
  c.nome AS nome
FROM
  usuarios_cancoes AS uc
  INNER JOIN usuarios AS u ON (u.id = uc.usuario_id)
  INNER JOIN cancoes AS c ON (c.id = uc.cancao_id)
ORDER BY
  usuario,
  nome;
