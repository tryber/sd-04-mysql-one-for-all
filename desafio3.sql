/*
Desafio 3
Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter apenas duas colunas:
  1. A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
  2. A segunda coluna deve possuir o alias "nome" e exibir o nome da canção ouvida
    pela pessoa com base no seu histórico de reprodução.
Os resultados devem estar ordenados por nome da pessoa usuária em ordem alfabética
  e em caso de empate no nome os resultados devem ser ordenados pelo nome da canção em ordem alfabética.
*/
CREATE VIEW historico_reproducao_usuarios AS
  SELECT u.nome AS usuario, c.nome AS nome
  FROM SpotifyClone.historico_reproducao AS hr
  INNER JOIN SpotifyClone.usuario AS u ON u.id = hr.usuario_id
  INNER JOIN SpotifyClone.cancao AS c ON c.id = hr.cancao_id
  ORDER BY usuario ASC, nome ASC;
