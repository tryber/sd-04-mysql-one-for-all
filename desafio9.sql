DELIMITER $$
create procedure albuns_do_artista (
in nome VARCHAR(100))
BEGIN
select distinct artista.nome as artista, album.albuns as album
from artista
inner join album
on artista.artista_id = album.artista_id
having artista.nome = artista.nome
order by album.albuns;
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
