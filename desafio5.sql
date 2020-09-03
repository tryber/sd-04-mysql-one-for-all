CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancoes_name AS cancao, COUNT(h.id_cancoes) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico AS h
ON c.cancoes_id = h.id_cancoes
GROUP BY cancao
order by reproducoes desc, cancao
LIMIT 2;
