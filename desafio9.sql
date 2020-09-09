DELIMITER $$
create procedure albuns_do_artista (
in nome_artista VARCHAR(100))
BEGIN
select a.artista, al.album
from artista a
inner join album al
on a.artista_id = al.artista_id
having a.artista = nome_artista
order by album;
END $$
DELIMITER ;

call albuns_do_artista("Walter Phoenix")
/*Crie uma procedure chamada albuns_do_artista que recebe 
como parâmetro o nome de uma pessoa artista e em retorno deve exibir as seguintes colunas:
O nome da pessoa artista, com o alias "artista".
O nome do álbum, com o alias "album".
Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.
Confirme a execução correta da procedure, chamando-a e passando o nome i
gual a "Walter Phoenix". Sua procedure deve retornar o mesmo que o resultado abaixo:
CALL albuns_do_artista('Walter Phoenix');*/
