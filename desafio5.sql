CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.cancao cancao, COUNT(h.idcancao) reproducoes
    FROM
        cancoes c
            INNER JOIN
        historico h ON h.idcancao = c.idcancao
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
