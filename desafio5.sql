CREATE VIEW top_2_hits_do_momento AS
SELECT can.cancao AS cancao, COUNT(his.cancao_id) AS reproducoes
FROM SpotifyClone.historico_de_reproducoes AS his
INNER JOIN SpotifyClone.cancoes AS can ON can.cancao_id = his.cancao_id
GROUP BY can.cancao_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
