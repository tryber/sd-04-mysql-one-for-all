CREATE VIEW cancoes_premium AS
SELECT
c.titulo AS nome,
COUNT(h.cancoes_id) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_reproducao AS h
ON c.id = h.cancoes_id
INNER JOIN SpotifyClone.usuario AS u
ON u.id = h.usuario_id
WHERE u.plano_id IN (2, 3)
GROUP BY c.titulo
ORDER BY `nome`;
