-- Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter apenas duas colunas:
-- A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
-- A segunda coluna deve possuir o alias "nome" e exibir o nome da canção ouvida pela pessoa com base no seu histórico de reprodução.
-- Os resultados devem estar ordenados por nome da pessoa usuária em ordem alfabética e em caso de empate no nome os resultados devem
-- ser ordenados pelo nome da canção em ordem alfabética.
CREATE VIEW historico_reproducao_usuarios AS
SELECT 
    U.nome AS 'usuario', C.titulo AS 'nome'
FROM
    SpotifyClone.historico_reproducoes AS H
        INNER JOIN
    SpotifyClone.usuario AS U ON H.usuario_id = U.usuario_id
INNER JOIN SpotifyClone.cancoes AS C ON C.cancoes_id = H.cancoes_id
ORDER BY `usuario`, `nome`; 
