CREATE VIEW top_2_hits_do_momento AS
SELECT track_name AS 'cancao', (
SELECT COUNT(user_id) FROM SpotifyClone.track_history
WHERE track_id = SpotifyClone.track.track_id) AS 'reproducoes'
FROM SpotifyClone.track
ORDER BY 2 DESC, 1
LIMIT 2;
