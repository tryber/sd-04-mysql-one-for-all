CREATE VIEW cancoes_premium AS
SELECT
c.cancao AS nome,
COUNT(uc.usuario_id) AS reproducoes
FROM SpotifyClone.usuarios_cancoes AS uc
JOIN SpotifyClone.cancoes AS c
ON c.cancao_id = uc.cancao_id
GROUP BY nome;
