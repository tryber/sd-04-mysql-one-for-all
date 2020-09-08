USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(150))
BEGIN
  SELECT artistas.nome AS artista,
    albums.nome AS album
    FROM SpotifyClone.artistas AS artistas
    INNER JOIN SpotifyClone.albums AS albums
    ON albums.id_artista = artistas.id
    WHERE artistas.nome = nome
    ORDER BY album;
END $$

DELIMITER ;
