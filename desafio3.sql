CREATE VIEW historico_reproducao_usuarios AS
    SELECT
		users.name AS usuario, songs.name AS nome
    FROM
		SpotifyClone.users AS users
	INNER JOIN
		SpotifyClone.playback_history AS ph ON ph.user_id = users.user_id
	INNER JOIN
		SpotifyClone.songs AS songs ON ph.song_id = songs.song_id
	ORDER BY usuario, nome;

select * from historico_reproducao_usuarios;