CREATE VIEW historico_reproducao_usuarios AS
SELECT (
SELECT user_name FROM SpotifyClone.user
WHERE user_id = SpotifyClone.track_history.user_id
) AS 'usuario', (
SELECT track_name FROM SpotifyClone.track
WHERE track_id = SpotifyClone.track_history.track_id
) AS 'nome'
FROM SpotifyClone.track_history
ORDER BY 1, 2;
