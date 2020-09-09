CREATE VIEW perfil_artistas AS
  SELECT 
    s.title AS nome,
    COUNT(ph.song) AS reproducoes
  FROM songs AS s, playback_history AS ph, users AS u
  WHERE s.id = ph.song AND (u.plan >= 2 AND u.id = ph.user)
  GROUP BY s.id
  ORDER BY s.title
  