CREATE VIEW historico_reproducao_usuarios AS
SELECT
    u.nome AS usuario,
    c.titulo AS nome
FROM
    SpotifyClone.musicas_escutadas ms
    INNER JOIN SpotifyClone.usuarios u ON u.usuario_id = ms.usuario_id
    INNER JOIN SpotifyClone.cancoes c ON c.cancao_id = ms.cancao_id
ORDER BY
    usuario,
    nome;
