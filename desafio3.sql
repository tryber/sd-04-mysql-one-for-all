CREATE VIEW historico_reproducao_usuarios
AS
  (
  SELECT
    usuarios.usuario_nome AS usuario,
    cancoes.cancao_nome AS nome
  FROM
    historico AS historico
    INNER JOIN usuarios AS usuarios ON (usuarios.usuario_id = historico.usuario_id)
    INNER JOIN cancoes AS cancoes ON (cancoes.cancao_id = historico.cancao_id)
  ORDER BY
    usuario,
    nome
);
