USE SpotifyClone;

DROP PROCEDURE IF EXISTS albuns_do_artista;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistName VARCHAR(100))
BEGIN
    SELECT
      ar.name AS artista,
      al.name AS album
    FROM SpotifyClone.album AS al
    JOIN SpotifyClone.artist AS ar ON ar.id = al.id_artist AND artistName = ar.name
    ORDER BY album;
END $$

DELIMITER ;

-- Chamando procedure:

CALL albuns_do_artista("Walter Phoenix");
