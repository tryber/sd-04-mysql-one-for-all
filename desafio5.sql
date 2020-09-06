CREATE VIEW top_2_hits_do_momento AS
SELECT s.song_name AS `cancao`,
COUNT(sh.song_id) AS `reproducoes`
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.song_history AS sh
ON s.song_id = sh.song_id
GROUP BY `cancao`
ORDER BY  `reproducoes` DESC, `cancao`
LIMIT 2;
