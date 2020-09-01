CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.nome AS usuario,
c.nome AS nome
FROM SpotifyClone.historico_reproducoes AS hist
JOIN SpotifyClone.usuario AS u ON u.id = hist.usuario_id
JOIN SpotifyClone.cancoes AS c ON c.id = hist.cancoes_id
ORDER BY usuario, nome;

-- SELECT * FROM historico_reproducao_usuarios;
