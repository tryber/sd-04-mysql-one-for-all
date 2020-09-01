CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT s.name) AS artistas,
  COUNT(DISTINCT art.name) AS cancoes,
  COUNT(DISTINCT alb.name) AS albuns
FROM Artists AS art
  JOIN albums AS alb ON alb.artist_id = art.id
  JOIN Songs AS s ON s.album_id = alb.id;
  