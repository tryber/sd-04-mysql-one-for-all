CREATE VIEW historico_reproducao_usuarios as
SELECT u.user_name AS `nome`, s.song_name AS `song` FROM SpotifyClone.user as u
INNER JOIN SpotifyClone.song_history as sh
ON u.user_id = sh.user_id
INNER JOIN SpotifyClone.song as s
ON s.song_id = sh.song_id
ORDER BY `nome`, `song`;
