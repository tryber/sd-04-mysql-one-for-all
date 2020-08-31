CREATE VIEW faturamento_atual AS
SELECT
  CONVERT(ROUND(MIN(plan_values), 2), char) AS `faturamento_minimo`,
  CONVERT(ROUND(MAX(plan_values), 2), CHAR) AS `faturamento_maximo`,
  CONVERT(ROUND(AVG(plan_values), 2), CHAR) AS `faturamento_medio`,
  CONVERT(ROUND(SUM(plan_values), 2), CHAR) AS `faturamento_total`
FROM
  (
    SELECT
      (
        SELECT
          valor
        FROM
          SpotifyClone.planos
        WHERE
          planos.plano_id = usuarios.plano_id
      ) AS plan_values
    FROM
      SpotifyClone.usuarios
  ) AS A;
