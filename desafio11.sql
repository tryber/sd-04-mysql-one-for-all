CREATE VIEW cancoes_premium AS
SELECT
  c.nome nome,
  COUNT(*) reproducoes
FROM
  SpotifyClone.usuarios u
INNER JOIN
  SpotifyClone.planos p ON
  u.planos_id = p.id AND 
  (p.plano = 'familiar' OR
  p.plano = 'universitário')
INNER JOIN
  SpotifyClone.historico_reproducoes hr ON
  hr.usuarios_id = u.id
INNER JOIN
  SpotifyClone.cancoes c ON
  c.id = cancoes_id
GROUP BY
  nome;
