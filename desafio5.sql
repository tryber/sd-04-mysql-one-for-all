CREATE VIEW top_2_hits_do_momento AS
SELECT cancoes.cancao AS cancao,
COUNT(reproducoes.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS cancoes
JOIN SpotifyClone.historico_de_reproducoes AS reproducoes
ON cancoes.cancao_id = reproducoes.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
