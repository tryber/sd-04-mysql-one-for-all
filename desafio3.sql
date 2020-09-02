CREATE VIEW historico_reproducao_usuarios AS
  (SELECT u.nome AS usuario, c.nome AS nome FROM SpotifyClone.usuarios AS u
    INNER JOIN SpotifyClone.historico_reproducoes AS hr
    ON u.id = hr.usuario_id
    INNER JOIN SpotifyClone.cancoes AS c
    ON hr.cancao_id = c.id
    ORDER BY usuario, nome
);
