create view historico_reproducao_usuarios
as select nome as usuario,
cancoes as nome
from usuario
inner join historico_reproducao
on usuario.usuario_id = historico_reproducao.usuario_id
inner join cancao
on cancao.cancao_id = historico_reproducao.cancao_id
order by usuario.nome,cancao.cancoes;

/*Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter apenas duas colunas:
A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
A segunda coluna deve possuir o alias "nome" e exibir o nome da canção ouvida pela pessoa 
com base no seu histórico de reprodução.
Os resultados devem estar ordenados por nome da pessoa usuária em ordem alfabética
e em caso de empate no nome os resultados devem ser ordenados pelo nome da canção em ordem alfabética.*/
