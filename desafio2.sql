USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
  SELECT COUNT(DISTINCT s.id) AS `cancoes`, COUNT(DISTINCT art.id) AS `artistas`, COUNT(DISTINCT alb.id) AS `albuns`
  FROM songs AS s, album AS alb, artists AS art;