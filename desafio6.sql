create view faturamento_atual
as select min(valor_plano) as faturamento_minimo,
max(valor_plano) as faturamento_maximo,
round(avg(valor_plano),2) as faturamento_medio,
sum(valor_plano) as faturamento_total
from usuario
inner join plano
on plano.plano_id = usuario.plano_id 

/*Tendo como base o valor dos planos e o plano que cada pessoa usuária cadastrada possui no banco, queremos algumas informações 
sobre o faturamento da empresa. Crie uma VIEW chamada faturamento_atual que deve exibir quatro dados:
A primeira coluna deve ter o alias "faturamento_minimo" e exibir o menor valor de plano existente para uma pessoa usuária.
A segunda coluna deve ter o alias "faturamento_maximo" e exibir o maior valor de plano existente para uma pessoa usuária.
A terceira coluna deve ter o alias "faturamento_medio" e exibir o valor médio dos planos possuídos por pessoas usuárias até o momento.
Por fim, a quarta coluna deve ter o alias "faturamento_total" e exibir o valor total obtido com os planos possuídos por pessuas usuárias.
Para cada um desses dados, por se tratarem de valores monetários, deve-se arredondar o faturamento usando apenas duas casas decimais.*/
