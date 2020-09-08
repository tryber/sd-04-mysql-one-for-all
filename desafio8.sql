DELIMITER $$
CREATE TRIGGER trigger_usuario_delete 
BEFORE DELETE ON SpotifyClone.usuario 
FOR EACH ROW
BEGIN
DELETE FROM seguir_artista 
WHERE usuario_id = OLD.usuario_id;
DELETE FROM historico_reproducao
WHERE usuario_id = OLD.usuario_id;
END $$

/*Crie uma trigger chamada trigger_usuario_delete que deve ser disparada sempre que 
uma pessoa usuária for excluída do banco de dados, refletindo essa exclusão em todas as 
tabelas que ela estiver.
Teste a funcionalidade correta de sua trigger, fazendo a exclusão da usuária "Thati".*/
