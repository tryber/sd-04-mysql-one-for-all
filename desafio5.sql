CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao, COUNT(*) AS reproducoes FROM usuarios u 
INNER JOIN usuarios_cancoes uc ON uc.id_usuario = u.id_usuario 
INNER JOIN cancoes c ON uc.id_cancao = c.id_cancao
GROUP BY c.cancao
ORDER BY reproducoes DESC, c.cancao
LIMIT 2;
