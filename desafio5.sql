CREATE VIEW top_2_hits_do_momento AS
  SELECT songs.name AS cancao, COUNT(*) AS reproducoes FROM songs
  INNER JOIN playback_history as playback_history
  ON songs.song_id = playback_history.song_id
  GROUP BY songs.song_id
  ORDER BY reproducoes DESC, cancao LIMIT 2;
