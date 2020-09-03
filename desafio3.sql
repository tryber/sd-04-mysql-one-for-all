CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        (SELECT 
                nome
            FROM
                usuario u
            WHERE
                u.id = hr.usuario_id) AS usuario,
        (SELECT 
                nome
            FROM
                cancao c
            WHERE
                c.id = hr.cancao_id) AS nome
    FROM
        historico_reproducao hr
    ORDER BY usuario , nome;
