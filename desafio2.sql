create view estatisticas_musicais
as select count(cancoes) as cançoes,
count( distinct nome) as artista,
count( distinct albuns) as albuns
from cancao;

/* Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns". */
