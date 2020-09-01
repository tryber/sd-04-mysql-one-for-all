-- DROP VIEW cancoes_premium;

CREATE VIEW cancoes_premium AS
SELECT
c.nome AS nome,
COUNT(hr.cancoes_id) AS reproducoes
FROM
SpotifyClone.historico_reproducoes AS hr,
SpotifyClone.usuario AS u,
SpotifyClone.cancoes AS c
WHERE hr.cancoes_id = c.id
AND u.id = hr.usuario_id
AND u.plano_id IN (2, 3)
GROUP BY c.nome
ORDER BY nome;

-- SELECT * FROM cancoes_premium;
