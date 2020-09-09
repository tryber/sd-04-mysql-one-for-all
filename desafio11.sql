CREATE VIEW cancoes_premium AS
SELECT
    c.titulo nome,
    COUNT(ms.cancao_id) reproducoes
FROM
    SpotifyClone.cancoes c
    INNER JOIN SpotifyClone.musicas_escutadas ms ON ms.cancao_id = c.cancao_id
    INNER JOIN SpotifyClone.usuarios u ON u.usuario_id = ms.usuario_id
WHERE
    u.plano_id IN (2, 3)
GROUP BY
    c.titulo
ORDER BY
    nome;
