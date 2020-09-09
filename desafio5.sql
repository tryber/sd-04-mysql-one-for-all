CREATE VIEW top_2_hits_do_momento AS
  SELECT s.title AS cancao, COUNT(ph.song) AS reproducoes
  FROM songs AS s, playback_history AS ph
  WHERE s.id = ph.song
  GROUP BY s.id
  ORDER BY reproducoes DESC, s.title
  LIMIT 2;
