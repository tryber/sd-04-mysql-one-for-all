DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN name VARCHAR(50))
BEGIN
SELECT ar.artist_name `artista`, al.album_name `album` 
FROM artist ar 
INNER JOIN album al WHERE ar.artist_name = name AND ar.id = al.artist_id;
END; $$

CALL albuns_do_artista('Walter Phoenix');
