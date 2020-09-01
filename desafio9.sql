USE SpotifyClone;

DELIMITER $ $ CREATE PROCEDURE albuns_do_artista(IN name VARCHAR(45)) BEGIN
SELECT
  (
    SELECT
      name
    FROM
      SpotifyClone.artists
    WHERE
      albuns.artist_id = artists.artist_id
  ) AS artista,
  name AS album
FROM
  SpotifyClone.albuns
WHERE
  albuns.artist_id = (
    SELECT
      artist_id
    FROM
      SpotifyClone.artists
    WHERE
      artists.name = name
  );

END $ $ DELIMITER;
