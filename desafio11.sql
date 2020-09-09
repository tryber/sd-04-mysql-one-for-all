create view cancoes_premium
as select cancao.cancoes as nome,
count(historico_reproducao.cancao_id) as reproducoes
from historico_reproducao
inner join cancao
on cancao.cancao_id = historico_reproducao.cancao_id
inner join usuario
on (usuario.usuario_id = historico_reproducao.usuario_id)
where usuario.plano_id = 2 or usuario.plano_id = 3
group by cancao.cancoes, historico_reproducao.usuario_id
order by cancao.cancoes

/*Crie uma VIEW chamada cancoes_premium que exiba o nome e a 
quantidade de vezes que cada canção foi tocada por pessoas usuárias 
do plano familiar ou universitário, de acordo com os detalhes a seguir:
A primeira coluna deve exibir o nome da canção, com o alias "nome";
A segunda coluna deve exibir a quantidade de pessoas que 
já escutaram aquela canção, com o alias "reproducoes";
Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.*/
