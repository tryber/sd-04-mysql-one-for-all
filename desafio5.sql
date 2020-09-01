-- DROP VIEW top_2_hits_do_momento;

CREATE VIEW top_2_hits_do_momento AS
SELECT c.nome AS cancao,
COUNT(*) AS reproducoes
FROM SpotifyClone.historico_reproducoes AS hr
JOIN SpotifyClone.cancoes AS c
ON c.id = hr.cancoes_id
GROUP BY hr.cancoes_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;

-- SELECT * FROM top_2_hits_do_momento;
