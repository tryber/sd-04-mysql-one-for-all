CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.usuario AS usuario,
c.cancao AS nome
FROM SpotifyClone.usuarios_cancoes AS uc
JOIN SpotifyClone.usuarios AS u ON u.usuario_id = uc.usuario_id
JOIN SpotifyClone.cancoes AS c ON c.cancao_id = uc.cancao_id
ORDER BY usuario, nome;
