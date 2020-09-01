-- Crie uma VIEW chamada cancoes_premium que exiba o nome e a quantidade de vezes que cada canção foi tocada por
-- pessoas usuárias do plano familiar ou universitário, de acordo com os detalhes a seguir:
-- A primeira coluna deve exibir o nome da canção, com o alias "nome";
-- A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "reproducoes";
-- Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.

CREATE VIEW cancoes_premium AS
SELECT 
    C.titulo AS 'nome', COUNT(H.cancoes_id) AS 'reproducoes'
FROM
    SpotifyClone.cancoes AS C
        INNER JOIN
    SpotifyClone.historico_reproducoes AS H ON C.cancoes_id = H.cancoes_id
    INNER JOIN SpotifyClone.usuario AS U ON H.usuario_id = U.usuario_id WHERE plano_id IN(2,3)
    GROUP BY C.titulo ORDER BY C.titulo;
