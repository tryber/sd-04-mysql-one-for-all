CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(120))
BEGIN
  SELECT
    art.nome AS artista,
    album.titulo AS album
  FROM SpotifyClone.artista AS art
  INNER JOIN SpotifyClone.album AS album
  ON art.artista_id = album.artista_id
  WHERE art.nome = nome_artista
  ORDER BY album ASC;
END $$
