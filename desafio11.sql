CREATE VIEW cancoes_premium AS
SELECT
  cancoes.cancao_nome AS nome,
  (
    SELECT
      COUNT(*)
    FROM
      historico
      INNER JOIN usuarios ON (usuarios.usuario_id = historico.usuario_id)
    WHERE
      cancoes.cancao_id = historico.cancao_id
      AND usuarios.plano_id IN (2, 3)
  ) AS reproducoes
FROM
  cancoes
GROUP BY
  cancoes.cancao_id
ORDER BY
  reproducoes DESC,
  nome
LIMIT
  7;
