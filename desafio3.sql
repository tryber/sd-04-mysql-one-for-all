CREATE VIEW historico_reproducao_usuarios AS
SELECT 
    U.nome AS 'usuario', C.titulo AS 'nome'
FROM
    SpotifyClone.historico_reproducoes AS H
        INNER JOIN
    SpotifyClone.usuario AS U ON H.usuario_id = U.usuario_id
INNER JOIN SpotifyClone.cancoes AS C ON C.cancoes_id = H.cancoes_id
ORDER BY `usuario`, `nome`;
