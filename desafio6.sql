CREATE VIEW faturamento_atual AS
SELECT
  ROUND(MIN(value), 2) AS `faturamento_minimo`,
  ROUND(MAX(value), 2) AS `faturamento_maximo`,
  ROUND(AVG(value), 2) AS `faturamento_medio`,
  ROUND(SUM(value), 2) AS `faturamento_total`
FROM (SELECT (SELECT value FROM SpotifyClone.plans WHERE plans.plan_id = users.plan_id) AS value FROM SpotifyClone.users) AS A;
