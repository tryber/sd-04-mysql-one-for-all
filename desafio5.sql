CREATE VIEW top_2_hits_do_momento AS
SELECT titulo_cancao AS cancao, COUNT(cancao_id) AS reproducoes
FROM usuarios u
INNER JOIN historico_reproducoes hr ON hr.usuario_id = u.id_usuario
INNER JOIN cancoes c ON c.id_cancao = hr.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC
LIMIT 2;
