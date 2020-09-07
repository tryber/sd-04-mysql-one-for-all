-- Drop view if neccesary
DROP VIEW IF EXISTS historico_reproducao_usuarios;

-- Create historico_reproducao_usuarios view
CREATE VIEW historico_reproducao_usuarios AS
SELECT u.username AS usuario,
    s.name AS nome
FROM users AS u
    INNER JOIN songs_history AS sh ON sh.user = u.user_id
    INNER JOIN songs AS s ON s.song_id = sh.song
ORDER BY u.username ASC,
    s.name ASC;
