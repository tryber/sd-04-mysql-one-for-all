create view estatisticas_musicais
as select count(cancoes) as cancoes,
count( distinct nome) as artista,
count( distinct albuns) as albuns
from cancao
inner join album
on album.album_id = cancao.album_id
inner join artista
on artista.artista_id = album.artista_id;

/* Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns". */
