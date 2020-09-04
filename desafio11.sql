CREATE VIEW cancoes_premium AS
SELECT s.song_name `nome`, COUNT(h.user_id) `reproducoes`
FROM songs s 
INNER JOIN history h, users u WHERE h.song_id = s.id AND h.user_id = u.id AND plan_id <> 1
GROUP BY `nome`
ORDER BY `nome` ASC;
