CREATE VIEW cancoes_premium AS
  (SELECT c.nome AS nome,
    COUNT(hr.cancao_id) AS reproducoes
    FROM SpotifyClone.usuarios AS u
    INNER JOIN SpotifyClone.historico_reproducoes AS hr
    ON u.id = hr.usuario_id
    INNER JOIN SpotifyClone.cancoes AS c
    ON hr.cancao_id = c.id
    where u.id_plano IN (2, 3)
    GROUP BY c.nome
    ORDER BY c.nome
);
