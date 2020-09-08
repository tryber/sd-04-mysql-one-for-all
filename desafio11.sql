CREATE VIEW cancoes_premium AS
  (SELECT c.nome AS nome,
    COUNT(h.cancao_id) AS reproducoes
    FROM SpotifyClone.usuarios AS u
    INNER JOIN SpotifyClone.historico_reproducoes AS h
    ON h.usuario_id = u.id
    INNER JOIN SpotifyClone.cancoes AS c
    ON h.cancao_id = c.id
    where u.id_plano IN (2, 3)
    GROUP BY c.nome
    ORDER BY c.nome
);
