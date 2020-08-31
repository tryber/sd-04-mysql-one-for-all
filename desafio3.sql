CREATE VIEW historico_reproducao_usuarios AS
SELECT
U.nome AS `usuario`,
M.nome AS `nome`
FROM SpotifyClone.historico_reproducoes AS HR
INNER JOIN SpotifyClone.usuario AS U ON HR.usuario_id = U.id
INNER JOIN SpotifyClone.musica AS M ON HR.musica_id = M.id
ORDER BY `usuario`, `nome`;
