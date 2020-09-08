DELIMITER &&
CREATE TRIGGER trigger_usuario_delete 
BEFORE DELETE ON usuario 
FOR EACH ROW
BEGIN
delete from seguir_artista
where usuario_id = OLD.usuario_id;
delete from historico_reproducao
where usuario= OLD.usuario_id;
END;
DELIMITER;

/*Crie uma trigger chamada trigger_usuario_delete que deve ser disparada sempre que 
uma pessoa usuária for excluída do banco de dados, refletindo essa exclusão em todas as 
tabelas que ela estiver.
Teste a funcionalidade correta de sua trigger, fazendo a exclusão da usuária "Thati".*/
