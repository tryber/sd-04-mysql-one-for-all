USE SpotifyClone;
CREATE VIEW historico_reproducao_usuarios AS
  (SELECT u.nome AS usuario, c.nome AS nome FROM SpotifyClone.usuarios AS u
    INNER JOIN SpotifyClone.historico_reproducoes AS h
    ON u.id = h.usuario_id
    INNER JOIN SpotifyClone.cancoes AS c
    ON h.cancao_id = c.id
    ORDER BY usuario, nome
);

  