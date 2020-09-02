DELIMITER $$
CREATE PROCEDURE albuns_do_artista(musico VARCHAR(20))
BEGIN
SELECT
a.nome_artista AS artista, al.nome_album AS album
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS al
ON a.id_artista = al.id_artista
WHERE musico = a.nome_artista
ORDER BY album;
END $$
DELIMITER ;
