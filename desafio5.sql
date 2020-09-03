CREATE VIEW top_2_hits_do_momento AS
SELECT s.name AS cancao,
  COUNT(sh.user_id) AS reproducoes
FROM Songs_History AS sh
  JOIN Songs AS s ON s.id = sh.song_id
GROUP BY s.id
ORDER BY reproducoes DESC,
  s.name ASC
LIMIT 2
