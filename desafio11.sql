CREATE VIEW cancoes_premium AS
SELECT
c.cancao AS nome,
COUNT(uc.usuario_id) AS reproducoes
FROM SpotifyClone.usuarios_cancoes AS uc
JOIN SpotifyClone.cancoes AS c ON c.cancao_id = uc.cancao_id
JOIN SpotifyClone.usuarios AS u ON u.usuario_id = uc.usuario_id
WHERE u.plano_id IN (2, 3)
GROUP BY nome
ORDER BY nome;

