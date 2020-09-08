USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista (IN var VARCHAR(200))
BEGIN
  SELECT
  nome_artista AS artista,
  nome_album AS album
  FROM artistas AS a
  INNER JOIN albuns AS ab ON (a.id_artista = ab.artista_id)
  INNER JOIN artista_seguidores seg ON seg.artista_id = a.id_artista
  WHERE nome_artista LIKE CONCAT('%',var, '%')
  GROUP BY artista, album
  ORDER BY artista, album;
END $$

DELIMITER ;
