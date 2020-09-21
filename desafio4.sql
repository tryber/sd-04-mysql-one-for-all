CREATE VIEW top_3_artistas AS
    SELECT 
        art.nome AS 'artista', COUNT(seg.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.Artista AS art
            INNER JOIN
        SpotifyClone.Seguindo AS seg ON art.id = seg.artista_id
    GROUP BY art.nome
    ORDER BY `seguidores` DESC , art.nome ASC
    LIMIT 3;
