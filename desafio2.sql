/*
Desafio 2
Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
  1. A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
  2. A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
  3. A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".
*/
CREATE VIEW estatisticas_musicais AS
  SELECT COUNT(id) AS cancoes,
  (SELECT COUNT(id) FROM SpotifyClone.artista) AS artistas,
  (SELECT COUNT(id) FROM SpotifyClone.album) AS albuns
FROM SpotifyClone.cancao;
