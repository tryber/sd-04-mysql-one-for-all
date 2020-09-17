/*
Desafio 10
Crie uma function chamada de quantidade_musicas_no_historico que exibe a quantidade de músicas
  que estão presentes atualmente no histórico de reprodução de uma pessoa usuária.
  Ao receber o código identificador da pessoa, exiba a quantidade de canções em seu histórico de reprodução.
*/
USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE qtd INT;
  SELECT COUNT(usuario_id) FROM SpotifyClone.historico_reproducao
  WHERE usuario_id = id_usuario INTO qtd;
  RETURN qtd;
END $$
DELIMITER ;
