/*
Desafio 11
Crie uma VIEW chamada cancoes_premium que exiba o nome e a quantidade de vezes que cada canção
  foi tocada por pessoas usuárias do plano familiar ou universitário, de acordo com os detalhes a seguir:
    - A primeira coluna deve exibir o nome da canção, com o alias "nome";
    - A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "reproducoes";
    - Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.
*/
CREATE VIEW cancoes_premium AS
  SELECT c.nome AS nome, COUNT(hr.cancao_id) AS reproducoes
    FROM SpotifyClone.historico_reproducao AS hr
    INNER JOIN SpotifyClone.cancao AS c ON c.id = hr.cancao_id
    WHERE hr.usuario_id 
    IN (
      SELECT id FROM SpotifyClone.usuario
      WHERE plano_id IN (2, 3)
    )
    GROUP BY nome
    ORDER BY nome ASC;
