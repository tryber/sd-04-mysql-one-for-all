/*
Desafio 9
Crie uma procedure chamada albuns_do_artista que recebe como parâmetro o nome de uma pessoa artista
  e em retorno deve exibir as seguintes colunas:
    1. O nome da pessoa artista, com o alias "artista".
    2. O nome do álbum, com o alias "album".
Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.
*/
USE SpotifyClone;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista( IN nome_artista VARCHAR(100) )
BEGIN
  SELECT art.nome AS artista, alb.nome AS album
  FROM SpotifyClone.album AS alb
  INNER JOIN SpotifyClone.artista AS art ON art.id = alb.artista_id
  WHERE art.nome = nome_artista
  ORDER BY album ASC;
END $$
DELIMITER ;
