CREATE VIEW faturamento_atual AS
SELECT MIN(valor) AS `faturamento_minimo`,
MAX(valor) AS `faturamento_maximo`,
ROUND(AVG(valor), 2) AS `faturamento_medio`,
ROUND(SUM(valor), 2) AS `faturamento_total`
FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.usuarios AS U
ON P.id = U.plano_id;


-- SELECT * FROM faturamento_atual;
