-- create view top_3_artistas
-- as
 select artista.nome as artista,
count(seguir_artista.artista_id) as seguidores 
from artista
inner join seguir_artista
on artista.artista_id = seguir_artista.artista_id
group by seguir_artista.artista_id
order by seguidores desc, artista limit 3;

/*Crie uma VIEW com o nome top_3_artistas que deve mostrar somente as três pessoas artistas mais populares 
no banco SpotifyClone, possuindo as seguintes colunas:
A primeira coluna deve possuir o alias "artista" e exibir o nome da pessoa artista.
A segunda coluna deve ter o alias "seguidores" e exibir a quantidade de pessoas que estão seguindo aquela pessoa artista.
Seu resultado deve estar ordenado em ordem decrescente, baseando-se na quantidade de seguidores. 
Em caso de empate, ordene os resultados pelo nome da pessoa artista em ordem alfabética. */
