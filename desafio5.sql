CREATE VIEW top_2_hits_do_momento AS
SELECT
c.titulo cancao,
COUNT(*) reproducoes
FROM
cancoes c,
historico_de_reproducoes hr
WHERE
c.cancao_id = hr.cancao_id
GROUP BY
cancao
ORDER BY
reproducoes DESC,
cancao
LIMIT
2;
