CREATE VIEW estatisticas_musicais AS
SELECT u.name AS usuario,
  s.name AS nome
FROM songs_history AS sh
  JOIN users AS u ON u.id = sh.user_id
  JOIN songs AS s ON s.id = sh.song_id
ORDER BY u.name,
  s.name;
