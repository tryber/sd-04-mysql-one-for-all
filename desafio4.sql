CREATE VIEW top_3_artistas AS
SELECT 
    A.nome AS 'artista', COUNT(S.usuario_id) AS 'seguidores'
FROM
    SpotifyClone.artistas AS A
        INNER JOIN
    SpotifyClone.seguindo_artista AS S ON A.artista_id = S.artista_id
    GROUP BY S.artista_id ORDER BY `seguidores` DESC, `artista` LIMIT 3;
