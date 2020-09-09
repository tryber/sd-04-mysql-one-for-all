CREATE VIEW historico_reproducao_usuarios AS
SELECT usuarios.nome AS usuario, cancoes.cancao AS nome
FROM SpotifyClone.usuarios AS usuarios
JOIN SpotifyClone.historico_de_reproducoes AS historico
ON usuarios.usuario_id = historico.usuario_id
JOIN SpotifyClone.cancoes AS cancoes
ON cancoes.cancao_id = historico.cancao_id
ORDER BY usuario, nome;
