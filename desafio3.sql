USE SpotifyClone;

CREATE VIEW historico_reproducao_usuarios AS
SELECT U.nome AS `usuario`,
M.nome AS `nome`
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico_reproducao AS HR
ON HR.usuario_id = U.id
INNER JOIN SpotifyClone.musicas AS M
ON HR.musica_id = M.id
ORDER BY `usuario`, `nome`;

-- SELECT * FROM historico_reproducao_usuarios;
