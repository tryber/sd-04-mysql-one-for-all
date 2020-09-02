CREATE VIEW top_2_hits_do_momento AS
SELECT 
    cancoes.cancao AS cancao, count(cancoes.cancao) AS reproducoes
FROM
    SpotifyClone.historico_reprod AS reprod
        LEFT JOIN
    SpotifyClone.cancoes AS cancoes ON cancoes.cancao_id = reprod.cancao_id
GROUP BY cancao
ORDER BY 2 DESC, 1 LIMIT 2;
