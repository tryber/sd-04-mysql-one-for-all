CREATE VIEW cancoes_premium AS
SELECT
M.nome AS `nome`,
COUNT(HR.musica_id) AS `reproducoes`
FROM SpotifyClone.historico_reproducoes AS HR
INNER JOIN SpotifyClone.musica AS M ON HR.musica_id = M.id
INNER JOIN SpotifyClone.usuario AS U ON HR.usuario_id = U.id
WHERE U.plano_id IN (2, 3)
GROUP BY M.nome
ORDER BY `nome`;
