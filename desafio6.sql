/*
Desafio 6
Tendo como base o valor dos planos e o plano que cada pessoa usuária cadastrada possui no banco,
  queremos algumas informações sobre o faturamento da empresa. Crie uma VIEW chamada faturamento_atual
  que deve exibir quatro dados:
    1. A primeira coluna deve ter o alias "faturamento_minimo" e exibir o menor valor de plano existente
      para uma pessoa usuária.
    2. A segunda coluna deve ter o alias "faturamento_maximo" e exibir o maior valor de plano existente
      para uma pessoa usuária.
    3. A terceira coluna deve ter o alias "faturamento_medio" e exibir o valor médio dos planos possuídos
      por pessoas usuárias até o momento.
    4. Por fim, a quarta coluna deve ter o alias "faturamento_total" e exibir o valor total obtido com
      os planos possuídos por pessuas usuárias.
Para cada um desses dados, por se tratarem de valores monetários, deve-se arredondar o faturamento usando
   apenas duas casas decimais
*/
CREATE VIEW faturamento_atual AS
  SELECT ROUND(valor, 2) AS faturamento_minimo,
  ( SELECT ROUND(valor, 2) FROM SpotifyClone.plano WHERE id = 2 ) AS faturamento_maximo,
  ( SELECT ROUND(AVG(valor), 2) FROM SpotifyClone.usuario AS u
      INNER JOIN SpotifyClone.plano AS p ON p.id = u.plano_id ) AS faturamento_medio,
  ( SELECT ROUND(SUM(valor), 2) FROM SpotifyClone.usuario AS u
      INNER JOIN SpotifyClone.plano AS p ON p.id = u.plano_id ) AS faturamento_total
  FROM SpotifyClone.plano
  WHERE id = 1;
