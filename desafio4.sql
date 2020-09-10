/*
Desafio 4
Crie uma VIEW com o nome top_3_artistas que deve mostrar somente as três pessoas artistas
  mais populares no banco SpotifyClone, possuindo as seguintes colunas:
    1. A primeira coluna deve possuir o alias "artista" e exibir o nome da pessoa artista.
    2. A segunda coluna deve ter o alias "seguidores" e exibir a quantidade de pessoas
      que estão seguindo aquela pessoa artista.
Seu resultado deve estar ordenado em ordem decrescente, baseando-se na quantidade de seguidores.
  Em caso de empate, ordene os resultados pelo nome da pessoa artista em ordem alfabética.
*/
CREATE VIEW top_3_artistas AS
  SELECT a.nome AS artista, COUNT(sa.usuario_id) AS seguidores
  FROM SpotifyClone.seguindo_artista AS sa
  INNER JOIN SpotifyClone.artista AS a ON a.id = sa.artista_id
  GROUP BY artista
  ORDER BY seguidores DESC, artista ASC
  LIMIT 3;
