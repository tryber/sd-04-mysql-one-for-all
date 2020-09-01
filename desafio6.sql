-- DROP VIEW faturamento_atual;

CREATE VIEW faturamento_atual AS
SELECT
MIN(p.valor) AS faturamento_minimo,
MAX(p.valor) AS faturamento_maximo,
ROUND(AVG(p.valor), 2) AS faturamento_medio,
SUM(p.valor) AS faturamento_total
FROM SpotifyClone.planos AS p
JOIN SpotifyClone.usuario AS u
ON u.plano_id = p.id;

-- SELECT * FROM faturamento_atual;
