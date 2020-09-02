CREATE VIEW historico_reproducao_usuarios AS 
SELECT u.user `usuario`, s.song_name `nome`
FROM users u 
INNER JOIN history h
INNER JOIN songs s WHERE u.id = h.user_id AND h.song_id = s.id
ORDER BY `usuario` ASC, `nome` ASC;
