CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario AS `usuario`, c.cancao AS `nome`
FROM usuarios AS u
INNER JOIN cancoes_reproduzidas AS cr
ON u.usuario_id = cr.usuario_id
INNER JOIN cancoes AS c
ON c.cancao_id = cr.cancao_id
ORDER BY usuario, nome;
