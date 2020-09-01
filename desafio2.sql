USE SpotifyClone;

DROP VIEW IF EXISTS estatisticas_musicais;

CREATE VIEW estatisticas_musicais AS
    SELECT 
        (SELECT 
                COUNT(*)
            FROM
                cancoes) AS cancoes,
        (SELECT 
                COUNT(*)
            FROM
                artistas) AS artistas,
        (SELECT 
                COUNT(*)
            FROM
                albuns) AS albuns;
