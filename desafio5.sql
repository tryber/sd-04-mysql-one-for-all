CREATE VIEW top_2_hits_do_momento AS
SELECT
(
SELECT
nome_cancao
FROM SpotifyClone.cancao AS c
WHERE c.id_cancao = u.id_cancao
) AS cancao,
COUNT(id_cancao) AS reproducoes
FROM SpotifyClone.musica_usuario AS u
GROUP BY id_cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
