CREATE VIEW top_2_hits_do_momento AS
SELECT
    c.titulo AS cancao,
    COUNT(ms.cancao_id) AS reproducoes
FROM
    SpotifyClone.musicas_escutadas ms
    INNER JOIN SpotifyClone.cancoes c ON c.cancao_id = ms.cancao_id
GROUP BY
    c.titulo
ORDER BY
    reproducoes DESC,
    cancao
LIMIT
    2;
