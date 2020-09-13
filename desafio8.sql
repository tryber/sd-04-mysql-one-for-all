DELIMITER $$

create trigger trigger_usuario_delete before delete on usuarios
for each row 
begin delete from seguindo_artistas where usuario_id=old.usuario_id;
delete from historicos where usuario_id=old.usuario_id;
end;$$ 
