CREATE VIEW perfil_artistas AS
    SELECT 
        (SELECT 
                nome
            FROM
                SpotifyClone.Artista
            WHERE
                id = alb.artista_id) AS 'artista',
        alb.nome AS 'album',
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.Seguindo
            WHERE
                artista_id = alb.artista_id) AS `seguidores`
    FROM
        SpotifyClone.Album AS alb
    ORDER BY `seguidores` DESC , artista ASC , album ASC;          
