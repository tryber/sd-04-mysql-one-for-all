CREATE VIEW faturamento_atual AS
SELECT MIN(plan_price) AS 'faturamento_minimo',
MAX(plan_price) AS 'faturamento_maximo', (
SELECT ROUND(SUM(plan_price)/COUNT(SpotifyClone.user.user_id), 2)
FROM SpotifyClone.user ) AS 'faturamento_medio',
SUM(plan_price) AS 'faturamento_total'
FROM SpotifyClone.plan;
