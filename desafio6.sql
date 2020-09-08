CREATE VIEW faturamento_atual AS 
SELECT 
MIN(valor_plano) AS faturamento_minimo,
MAX(valor_plano) AS faturamento_maximo,
CAST(ROUND(AVG(valor_plano),2) AS CHAR ) AS faturamento_medio,
CAST(ROUND(SUM(valor_plano),2) AS CHAR) AS faturamento_total
FROM SpotifyClone.planos
INNER JOIN SpotifyClone.usuarios AS U
ON planos.planos_id = U.plano_id;
