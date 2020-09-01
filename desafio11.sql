CREATE VIEW cancoes_premium AS
SELECT s.song_name AS `nome`,
COUNT(h.song_id) AS `reproducoes`
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.song_history AS h
ON s.song_id = h.song_id
INNER JOIN SpotifyClone.user AS us
ON h.user_id = us.user_id
AND us.plan_id IN(2, 3)
GROUP BY `nome`
ORDER BY `nome`;
