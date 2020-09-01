USE SpotifyClone;

DROP VIEW historico_reproducao_usuarios;

CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        usuario.nome AS usuario, cancoes.nome AS nome
    FROM
        SpotifyClone.usuarios_cancoes AS historico
            INNER JOIN
        SpotifyClone.usuarios AS usuario ON usuario.id = historico.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS cancoes ON cancoes.id = historico.cancao_id
        ORDER BY usuario, nome;

SELECT * FROM historico_reproducao_usuarios;
