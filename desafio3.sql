CREATE VIEW historico_reproducao_usuarios AS
SELECT nome_usuario AS usuario, titulo_cancao AS nome FROM usuarios u
INNER JOIN historico_reproducoes hr ON hr.usuario_id = u.id_usuario
INNER JOIN cancoes c ON c.id_cancao = hr.cancao_id
ORDER BY nome_usuario, titulo_cancao;
