CREATE VIEW cancoes_premium AS
SELECT
(
SELECT cancao
FROM SpotifyClone.cancao AS c
WHERE c.id = hr.cancao_id
) AS nome,
COUNT(cancao_id) AS reproducoes
FROM SpotifyClone.historico_de_reproducao AS hr
WHERE
(
SELECT plano_id
FROM SpotifyClone.usuario AS u
WHERE u.id = hr.usuario_id
) IN(2, 3)
GROUP BY nome
ORDER BY nome ASC;
