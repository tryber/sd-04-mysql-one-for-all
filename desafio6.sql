CREATE VIEW faturamento_atual AS
SELECT 
MIN(pl.plan_price) AS faturamento_minimo,
MAX(pl.plan_price) AS faturamento_maximo,
ROUND(AVG(pl.plan_price), 2) AS faturamento_medio,
SUM(pl.plan_price) AS faturamento_total
FROM plan AS pl
INNER JOIN spotifyclone.user AS us
ON us.plan_id = pl.plan_id;
