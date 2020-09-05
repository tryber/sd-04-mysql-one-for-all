CREATE VIEW historico_reproducao_usuarios AS
SELECT (
SELECT usuario
FROM SpotifyClone.usuario AS u
WHERE u.id = hr.usuario_id
) AS usuario,
(
SELECT cancao
FROM SpotifyClone.cancao AS c
WHERE hr.cancao_id = c.id
) AS nome
FROM SpotifyClone.historico_de_reproducao AS hr
ORDER BY usuario ASC, nome ASC;
