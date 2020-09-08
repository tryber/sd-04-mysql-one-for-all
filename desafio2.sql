CREATE VIEW estatisticas_musicais AS
SELECT
  COUNT(ca.album_id) AS cancoes,
  COUNT(DISTINCT a.nome_artista) AS artistas,
  COUNT(DISTINCT ab.id_album) AS albuns
FROM artistas AS a
INNER JOIN albuns AS ab ON (a.id_artista = ab.artista_id)
INNER JOIN cancoes AS ca ON (ca.album_id = ab.id_album);
