CREATE VIEW top_2_hits_do_momento AS
SELECT
c.cancao AS cancao,
COUNT(*) AS reproducoes
FROM SpotifyClone.usuarios_cancoes AS uc
JOIN SpotifyClone.cancoes AS c
ON c.cancao_id = uc.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
