CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao AS `cancao`, COUNT(r.cancao_id) AS `reproducoes`
FROM cancoes AS c
INNER JOIN cancoes_reproduzidas AS r
ON c.cancao_id = r.cancao_id
GROUP BY cancao
HAVING reproducoes > 1
ORDER BY reproducoes DESC, cancao;
