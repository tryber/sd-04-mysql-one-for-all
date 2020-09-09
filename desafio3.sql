CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.nome usuario,
c.titulo nome
FROM
usuario u,
cancoes c,
historico_de_reproducoes hr
WHERE
u.usuario_id = hr.usuario_id AND
c.cancao_id = hr.cancao_id
ORDER BY
usuario,
nome;
