DROP VIEW IF EXISTS estatisticas_musicais;
CREATE VIEW faturamento_atual AS
SELECT MIN(price) AS faturamento_minimo,
  MAX(price) AS faturamento_maximo,
  ROUND(AVG(price), 2) AS faturamento_medio,
  SUM(price) AS faturamento_total
FROM Plans;
