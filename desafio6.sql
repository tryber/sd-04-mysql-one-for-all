CREATE VIEW faturamento_atual AS
SELECT MIN(p.planos_valor) AS faturamento_minimo, max(p.planos_valor) as faturamento_maximo,
ROUND(AVG(p.planos_valor),2) AS faturamento_medio, SUM(p.planos_valor) AS faturamento_tota
FROM SpotifyClone.planos as p
INNER JOIN SpotifyClone.usuario as u
ON p.planos_id = u.id_planos;
