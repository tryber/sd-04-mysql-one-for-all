
CREATE VIEW faturamento_atual
AS
  (SELECT
    MIN(valor) AS faturamento_minimo,
    MAX(valor) AS faturamento_maximo,
    ROUND(AVG(valor), 2) AS faturamento_medio,
    SUM(valor) AS faturamento_total
  FROM
    (SELECT
      u.plano_id, p.valor
    FROM
      SpotifyClone.usuarios AS u
      INNER JOIN SpotifyClone.planos AS p ON (p.id = u.plano_id)) AS usuarios_planos);
