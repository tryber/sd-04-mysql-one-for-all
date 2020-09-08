CREATE VIEW faturamento_atual AS 
SELECT MIN(valor_plano) AS faturamento_minimo,
MAX(valor_plano) AS faturamento_maximo,
ROUND(AVG(valor_plano), 2) AS faturamento_medio,
ROUND(SUM(valor_plano), 2) AS faturamento_total
FROM SpotifyClone.planos
INNER JOIN SpotifyClone.usuarios AS U
ON planos.planos_id = U.plano_id;
