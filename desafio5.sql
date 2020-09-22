CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        msc.nome AS 'cancao', COUNT(hist.musica_id) AS `reproducoes`
    FROM
        SpotifyClone.Musica AS msc
            INNER JOIN
        SpotifyClone.Historico_Reproducao AS hist ON msc.id = hist.musica_id
    GROUP BY msc.nome
    ORDER BY `reproducoes` DESC , msc.nome ASC
    LIMIT 2;
