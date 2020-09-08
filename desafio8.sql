DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
  AFTER DELETE ON usuarios
  FOR EACH ROW
BEGIN
  DELETE u
  FROM  usuarios u
  INNER JOIN historico_reproducoes hr ON hr.usuario_id = u.id_usuario
  INNER JOIN artista_seguidores seg ON seg.usuario_id = u.id_usuario;
END; $$
DELIMITER ;
