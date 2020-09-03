DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(nome_usuario varchar(50))
RETURNS int reads SQL data
BEGIN
RETURN (
    SELECT
        COUNT(cancao_id)
    FROM
        historico_reproducao
    WHERE
        (
            SELECT
                nome
            FROM
                usuario
            WHERE
                id = usuario_id
        ) = nome_usuario
    GROUP BY
        usuario_id
);

END $$
DELIMITER ;
