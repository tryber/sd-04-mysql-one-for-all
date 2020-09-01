CREATE VIEW historico_reproducao_usuarios AS
SELECT usr.usuario AS usuario, can.cancao AS nome
FROM SpotifyClone.historico_de_reproducoes AS his
INNER JOIN SpotifyClone.usuarios AS usr ON usr.usuario_id = his.usuario_id
INNER JOIN SpotifyClone.cancoes AS can ON can.cancao_id = his.cancao_id
ORDER BY usuario, nome;
