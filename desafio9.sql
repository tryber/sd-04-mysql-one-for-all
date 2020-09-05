USE SpotifyClone;
DELIMITER $$ CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(30)) BEGIN
SELECT artistas.nome AS artista,
  albuns.album AS album
FROM SpotifyClone.artistas AS artistas
  INNER JOIN SpotifyClone.albuns AS albuns ON artistas.id_artista = albuns.id_artista
WHERE artistas.nome = nome
ORDER BY album;
END $$ DELIMITER;
