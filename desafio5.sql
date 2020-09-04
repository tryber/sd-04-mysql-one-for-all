CREATE VIEW top_2_hits_do_momento AS
SELECT s.song_name `cancao`, COUNT(h.user_id) `reproducoes`
FROM songs s
INNER JOIN history h WHERE s.id = h.song_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao` ASC LIMIT 2;
