CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(p.valor), 2) faturamento_minimo,
ROUND(MAX(p.valor), 2) faturamento_maximo,
ROUND(AVG(p.valor), 2) faturamento_medio,
ROUND(SUM(p.valor), 2) faturamento_total
FROM
plano p,
usuario u
WHERE
p.plano_id = u.plano_id;
