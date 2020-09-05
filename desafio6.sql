CREATE VIEW faturamento_atual AS
SELECT (
SELECT valor_plano
FROM SpotifyClone.plano
ORDER BY valor_plano ASC
LIMIT 1
) AS faturamento_minimo,
(
SELECT valor_plano
FROM SpotifyClone.plano
ORDER BY valor_plano DESC
LIMIT 1
) AS faturamento_maximo,
(
SELECT ROUND(AVG((
SELECT valor_plano
FROM SpotifyClone.plano AS p
WHERE p.id = u.plano_id
)), 2)
FROM SpotifyClone.usuario AS u
) AS faturamento_medio,
(
SELECT ROUND(SUM((
SELECT valor_plano
FROM SpotifyClone.plano AS p
WHERE p.id = u.plano_id
)), 2)
FROM SpotifyClone.usuario AS u
) AS faturamento_total
