CREATE VIEW historico_reproducao_usuarios AS
SELECT 
    usuarios.usuario, cancoes.cancao AS nome
FROM
    SpotifyClone.historico_reprod AS reprod
        LEFT JOIN
    SpotifyClone.usuarios AS usuarios ON reprod.usuario_id = usuarios.usuario_id
        LEFT JOIN
    SpotifyClone.cancoes AS cancoes ON cancoes.cancao_id = reprod.cancao_id
ORDER BY 1 , 2;
