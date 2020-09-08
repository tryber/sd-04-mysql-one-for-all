CREATE VIEW historico_reproducao_usuarios AS
SELECT
    usuario AS usuario,
    (
        SELECT
            musica
        FROM
            SpotifyClone.cançoes
        WHERE
            cançoes.musica_id = H.musica_id
    ) AS nome
FROM
    SpotifyClone.usuarios,
    SpotifyClone.historico AS H
WHERE
    usuarios.usuario_id = H.usuario_id
ORDER BY
    usuario, nome;
