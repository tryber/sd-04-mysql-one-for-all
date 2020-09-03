CREATE VIEW faturamento_atual AS
SELECT MIN(price),
  MAX(price),
  ROUND(AVG(price), 2),
  SUM(price)
FROM Plans;
