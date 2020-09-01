CREATE VIEW historico_reproducao_usuarios AS
SELECT
(
SELECT
nome_usuario
FROM SpotifyClone.usuario AS u
WHERE u.id_usuario = m.id_usuario
) AS usuario,
(
SELECT
nome_cancao
FROM SpotifyClone.cancao AS c
WHERE c.id_cancao = m.id_cancao
) AS nome
FROM SpotifyClone.musica_usuario AS m
ORDER BY usuario, nome;
