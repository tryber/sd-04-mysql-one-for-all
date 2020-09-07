create view top_2_hits_do_momento
as select cancao.cancoes as cancao,
count(historico_reproducao.usuario_id) as reproducoes
from cancao
inner join historico_reproducao
on historico_reproducao.cancao_id = cancao.cancao_id
group by cancao.cancoes
order by reproducoes desc limit 2;

/*Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas 
músicas mais tocadas no momento. Crie uma VIEW chamada top_2_hits_do_momento que possua duas colunas:
A primeira coluna deve possuir o alias "cancao" e exibir o nome da canção.
A segunda coluna deve possuir o alias "reproducoes" e exibir a quantidade de pessoas que já escutaram a canção em questão.
Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções. Em caso de empate, ordene 
os resultados pelo nome da canção em ordem alfabética. Queremos apenas o top 2 de músicas mais tocadas.*/
