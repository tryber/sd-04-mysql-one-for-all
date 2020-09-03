CREATE VIEW historico_reproducao_usuarios AS
  SELECT
    u.nome usuario,
    c.nome nome
  FROM
    SpotifyClone.usuarios u,
    SpotifyClone.cancoes c,
    SpotifyClone.historico_reproducoes hr
  WHERE
    u.id = hr.usuarios_id AND
    c.id = hr.cancoes_id
  ORDER BY
    usuario,
    nome;
