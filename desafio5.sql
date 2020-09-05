CREATE VIEW top_2_hits_do_momento AS
SELECT cancao AS cancao, (
SELECT COUNT(cancao_id)
FROM SpotifyClone.historico_de_reproducao AS hr
WHERE hr.cancao_id = c.id
) AS reproducoes
FROM SpotifyClone.cancao AS c
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
