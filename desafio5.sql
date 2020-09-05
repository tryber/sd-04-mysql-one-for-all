CREATE VIEW top_2_hits_do_momento AS
SELECT 
    C.titulo AS 'cancao', COUNT(H.cancoes_id) AS 'reproducoes'
FROM
    SpotifyClone.cancoes AS C
        INNER JOIN
    SpotifyClone.historico_reproducoes AS H ON C.cancoes_id = H.cancoes_id
GROUP BY H.cancoes_id ORDER BY 2 DESC, 1 LIMIT 2;
