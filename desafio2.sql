DROP VIEW IF EXISTS estatisticas_musicais;

USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
    SELECT 
        (SELECT COUNT(cancao) FROM cancoes) AS cancoes,
        (SELECT COUNT(artista) FROM artistas) AS artistas,
        (SELECT COUNT(album) FROM albuns) AS albuns;
