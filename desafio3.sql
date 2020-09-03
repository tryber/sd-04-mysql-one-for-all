CREATE VIEW estatisticas_musicais AS
SELECT u.name AS usuario,
  s.name AS nome
FROM Songs_History AS sh
  JOIN Users AS u ON u.id = sh.user_id
  JOIN Songs AS s ON s.id = sh.song_id
ORDER BY u.name,
  s.name;
