DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;

USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id_pessoa_usuaria INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE musicas_historico INT;

SELECT COUNT(r.cancao_id)
INTO musicas_historico
FROM cancoes_reproduzidas AS r
INNER JOIN usuarios AS u
ON id_pessoa_usuaria = u.usuario_id AND u.usuario_id = r.usuario_id;

RETURN musicas_historico;

END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
