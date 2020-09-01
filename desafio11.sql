CREATE VIEW cancoes_premium AS
SELECT s.song_name AS `nome`,
COUNT(DISTINCT h.song_id) AS `reproducoes`
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.song_history AS h
ON s.song_id = h.song_id
-- WHERE plan_name IN('familiar', 'universitario')
GROUP BY `nome`
ORDER BY `nome`;
