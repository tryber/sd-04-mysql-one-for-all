CREATE VIEW cancoes_premium AS
  SELECT songs.name AS nome, COUNT(history.song_id) AS reproducoes
  FROM users
  INNER JOIN playback_history AS history
  ON users.user_id = history.user_id
  INNER JOIN songs AS songs
  ON history.song_id = songs.song_id
  WHERE users.plan_id IN (2, 3)
  GROUP BY songs.name
  ORDER BY songs.name;
