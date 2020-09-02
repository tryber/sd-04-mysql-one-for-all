CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario, c.cancao AS nome FROM usuarios u 
INNER JOIN usuarios_cancoes uc ON uc.id_usuario = u.id_usuario 
INNER JOIN cancoes c ON uc.id_cancao = c.id_cancao
ORDER BY u.usuario, c.cancao;
