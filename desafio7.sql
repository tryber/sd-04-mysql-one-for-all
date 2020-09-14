/*
Desafio 7
Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, com a quantidade de seguidores que ela possui,
  de acordo com os detalhes a seguir. Para tal, crie uma VIEW chamada perfil_artistas, com as seguintes colunas:
    1. A primeira coluna deve exibir o nome da pessoa artista, com o alias "artista".
    2. A segunda coluna deve exibir o nome do álbum, com o alias "album".
    3. A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista possui
      e deve possuir o alias "seguidores".
Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas seguidoras.
  Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética
  e caso há artistas com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente.
*/
/*
Referência
https://dev.mysql.com/doc/refman/5.7/en/group-by-handling.html#:~:text=This%20query%20might%20be%20invalid,FROM%20t%20GROUP%20BY%20name%3B&text=In%20such%20cases%2C%20MySQL%20recognizes,dependent%20on%20a%20grouping%20column.
*/

CREATE VIEW perfil_artistas AS
  SELECT ANY_VALUE(art.nome) AS artista,
  alb.nome AS album,
  COUNT(sa.artista_id) AS seguidores
  FROM SpotifyClone.album AS alb
  INNER JOIN SpotifyClone.artista AS art ON art.id = alb.artista_id
  INNER JOIN SpotifyClone.seguindo_artista AS sa ON sa.artista_id = alb.artista_id
  GROUP BY album
  ORDER BY seguidores DESC, artista ASC, album ASC;
