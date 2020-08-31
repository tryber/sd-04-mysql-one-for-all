USE SpotifyClone;
CREATE VIEW historico_reproducao_usuarios AS
SELECT
U.nome AS `usuario`,
M.nome AS `nome`
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.historico_reproducoes AS HR ON U.id = HR.usuario_id
INNER JOIN SpotifyClone.musica AS M ON HR.musica_id = M.id
ORDER BY `usuario`, `nome`;
