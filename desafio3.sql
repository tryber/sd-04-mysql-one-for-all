CREATE VIEW historico_reproducao_usuarios AS
SELECT usuario.nome_usuario AS 'usuario', cancoes.titulo_cancao AS 'nome'
FROM SpotifyClone.historico_reproducoes AS historico
INNER JOIN SpotifyClone.usuarios AS usuario ON usuario.usuario_id = historico.usuario_id
INNER JOIN SpotifyClone.cancoes AS cancoes ON cancoes.cancao_id = historico.cancao_id
ORDER BY 1, 2;
