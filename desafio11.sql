CREATE VIEW cancoes_premium AS
SELECT c.cancao AS `nome`, COUNT(r.cancao_id) AS `reproducoes`
FROM cancoes AS c
INNER JOIN cancoes_reproduzidas AS r
ON c.cancao_id = r.cancao_id
INNER JOIN usuarios AS u
ON r.usuario_id = u.usuario_id AND u.plano_id IN(2, 3)
GROUP BY nome
ORDER BY nome;
