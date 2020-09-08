CREATE VIEW historico_reproducao_usuarios AS
SELECT u.user_name AS `usuario`, s.song_name AS `nome`
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.song_history AS sh
ON u.user_id = sh.user_id
INNER JOIN SpotifyClone.song AS s
ON s.song_id = sh.song_id
ORDER BY `usuario`, `nome`;
