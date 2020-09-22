DELIMITER $$

CREATE PROCEDURE albuns_do_artista (IN artistName VARCHAR(100))
BEGIN
SELECT
art.nome AS 'artista',
alb.nome AS 'album'
FROM
SpotifyClone.Artista AS art
INNER JOIN
SpotifyClone.Album AS alb ON art.id = alb.artista_id
WHERE art.nome = artistName;
END;

$$ DELIMITER ;
