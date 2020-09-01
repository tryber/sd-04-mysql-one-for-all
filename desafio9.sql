-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.

-- SELECT 
--     A.nome AS 'artista', AL.titulo AS 'album'
-- FROM
--     SpotifyClone.artistas AS A
--         INNER JOIN
--     SpotifyClone.albuns AS AL ON A.artista_id = AL.artista_id
-- ORDER BY `album`;

USE SpotifyClone;
DELIMITER //

CREATE PROCEDURE albuns_do_artista (IN nomeArtista VARCHAR(50))
BEGIN
SELECT 
    A.nome AS 'artista', AL.titulo AS 'album'
FROM
    SpotifyClone.artistas AS A
        INNER JOIN
    SpotifyClone.albuns AS AL ON A.artista_id = AL.artista_id AND A.nome = nomeArtista
ORDER BY `album`;
END //

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
