CREATE VIEW faturamento_atual AS
SELECT
MIN(valor) AS faturamento_minimo,
MAX(valor) AS faturamento_maximo,
(
SELECT
ROUND(SUM(p.valor)/COUNT(u.id_usuario), 2)
FROM SpotifyClone.usuario AS u
) AS faturamento_medio,
SUM(valor) AS faturamento_total
FROM SpotifyClone.plano AS p;
