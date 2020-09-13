CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(p.valor_plano), 2) AS `faturamento_minimo`, -- Query ignores .00, so i've put it manually
MAX(p.valor_plano) AS `faturamento_maximo`,
ROUND(AVG(p.valor_plano), 2) AS `faturamento_medio`,
SUM(p.valor_plano) AS `faturamento_total`
FROM SpotifyClone.planos AS p
JOIN SpotifyClone.usuarios AS u
ON u.plano_id = p.plano_id;
