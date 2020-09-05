CREATE VIEW historico_reproducao_usuarios AS (
  SELECT u.nome AS usuario,
    c.musica AS nome
  FROM SpotifyClone.usuarios AS u
    INNER JOIN SpotifyClone.historico_reproducoes AS hru ON u.usuario_id = hru.usuario_id
    INNER JOIN SpotifyClone.musicas AS c ON hru.musica_id = c.musica_id
  ORDER BY usuario,
    nome
);
