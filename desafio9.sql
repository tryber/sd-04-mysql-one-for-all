USE SpotifyClone;
DELIMITER $$ CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100)) BEGIN
SELECT artistas.nome AS artista,
  albuNs.nome AS album
FROM SpotifyClone.artistas AS artistas
  INNER JOIN SpotifyClone.albuns AS albuns ON artistas.id = albuns.id_artista
WHERE artistas.nome = nome
ORDER BY album;
END $$ DELIMITER;
