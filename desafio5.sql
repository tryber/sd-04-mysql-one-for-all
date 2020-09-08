CREATE VIEW top_2_hits_do_momento AS
SELECT so.song_name AS `cancao`,
COUNT(so.song_id) AS `reproducoes`
FROM SpotifyClone.song AS so
INNER JOIN SpotifyClone.song_history AS sh
ON so.song_id = sh.song_id
GROUP BY `cancao`
ORDER BY  `reproducoes` DESC, `cancao` LIMIT 2;
