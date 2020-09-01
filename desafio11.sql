CREATE VIEW cancoes_premium AS
SELECT
  voice.titulo AS nome,
  (SELECT COUNT(cancao_id)
  FROM SpotifyClone.historico_reproducoes AS history
  WHERE history.cancao_id = voice.cancao_id) AS reproducoes
FROM SpotifyClone.cancao AS voice
INNER JOIN SpotifyClone.historico_reproducoes AS hr
ON voice.cancao_id = hr.cancao_id
INNER JOIN SpotifyClone.usuario AS usr
ON hr.usuario_id = usr.usuario_id
INNER JOIN SpotifyClone.plano AS plan
ON usr.plano_id = plan.plano_id
WHERE plan.tipo IN ('familiar', 'universitário')
ORDER BY nome ASC;
