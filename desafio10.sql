DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT) RETURNS INT
READS SQL DATA
BEGIN 
DECLARE quantidade INT;
SELECT COUNT(*) into quantidade FROM historico WHERE usuario_id = id;
RETURN quantidade;
END;
$$ DELIMITER ;

-- select usuario_id, quantidade_musicas_no_historico(usuario_id) from usuarios;
