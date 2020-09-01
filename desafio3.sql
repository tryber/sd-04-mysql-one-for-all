CREATE VIEW historico_reproducao_usuarios AS
SELECT user_name AS `usuario`, song_name AS `nome`
FROM spotifyclone.user AS us
INNER JOIN spotifyclone.song_history AS soh
ON us.user_id = soh.user_id
INNER JOIN spotifyclone.song AS sg
ON soh.song_id = sg.song_id
ORDER BY `usuario`, `nome`;
