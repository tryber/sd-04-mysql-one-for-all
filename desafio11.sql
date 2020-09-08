CREATE VIEW cancoes_premium AS
SELECT titulo_cancao AS nome, COUNT(hr.cancao_id) reproducoes FROM usuarios u
INNER JOIN historico_reproducoes hr ON hr.usuario_id = u.id_usuario
INNER JOIN cancoes c ON c.id_cancao = hr.cancao_id
WHERE u.plano_id = 2 OR u.plano_id = 3
GROUP BY nome
ORDER BY titulo_cancao;
