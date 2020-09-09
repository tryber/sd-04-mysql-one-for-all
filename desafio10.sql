USE SpotifyClone;

DELIMITER $ $ DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;

CREATE FUNCTION quantidade_musicas_no_historico(nome VARCHAR(100)) RETURNS INT READS SQL DATA BEGIN DECLARE total_tocadas INT;

SELECT
    COUNT(*)
FROM
    SpotifyClone.musicas_escutadas ms
    INNER JOIN SpotifyClone.usuarios u ON u.usuario_id = ms.usuario_id
WHERE
    u.nome LIKE 'Bill' INTO total_tocadas;

RETURN total_tocadas;

END $ $ DELIMITER;
