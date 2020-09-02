CREATE VIEW cancoes_premium AS
SELECT c.cancao AS nome, count(*) AS reproducoes FROM usuarios u 
INNER JOIN usuarios_cancoes uc ON uc.id_usuario = u.id_usuario 
INNER JOIN cancoes c ON uc.id_cancao = c.id_cancao
WHERE u.id_plano IN(2,3)
GROUP BY c.cancao
ORDER BY c.cancao;
