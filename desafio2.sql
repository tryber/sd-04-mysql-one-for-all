USE SpotifyClone;
CREATE VIEW estatisticas_musicais AS
SELECT
  Count(DISTINCT SpotifyClone.cancao.nome) AS cancoes,
  COUNT(DISTINCT SpotifyClone.artista.nome) AS artistas,
  COUNT(DISTINCT SpotifyClone.album.nome) AS albuns
FROM
  SpotifyClone.cancao
  INNER JOIN SpotifyClone.artista
  INNER JOIN SpotifyClone.album;
