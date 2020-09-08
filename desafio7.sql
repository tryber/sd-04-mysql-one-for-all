CREATE VIEW perfil_artistas AS
SELECT
  nome_artista AS artista,
  nome_album AS album,
  COUNT(usuario_id) As seguidores
FROM artistas AS a
INNER JOIN albuns AS ab ON (a.id_artista = ab.artista_id)
INNER JOIN artista_seguidores seg ON seg.artista_id = a.id_artista
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;
