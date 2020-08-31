USE SpotifyClone;
CREATE VIEW faturamento_atual AS
SELECT MIN(P.valor) AS `faturamento_minimo`,
MAX(P.valor) AS `faturamento_maximo`,
ROUND(AVG(P.valor),2) AS `faturamento_medio`,
ROUND(SUM(P.valor),2) AS `faturamento_total`
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.plano AS P WHERE U.plano_id = P.id;
