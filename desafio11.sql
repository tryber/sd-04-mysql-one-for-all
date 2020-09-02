CREATE VIEW cancoes_premium AS
SELECT 
    c.nome AS nome,
    (SELECT 
            COUNT(*)
        FROM
            usuarios_cancoes AS uc
                INNER JOIN
            usuarios AS u ON (u.id = uc.usuario_id)
        WHERE
            uc.cancao_id = c.id
                AND u.plano_id IN (2 , 3)) AS reproducoes
FROM
    cancoes AS c
GROUP BY c.id
ORDER BY reproducoes DESC, nome;
