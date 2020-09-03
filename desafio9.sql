DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(50)) BEGIN
  SELECT
    a.nome artista,
    al.nome album
  FROM
    SpotifyClone.artistas a
  INNER JOIN
    SpotifyClone.albuns al ON
    a.id = al.artistas_id AND
    a.nome = artista
  ORDER BY
    album;
END
$$ DELIMITER ;
