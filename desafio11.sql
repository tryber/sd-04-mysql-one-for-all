CREATE VIEW cancoes_premium AS
SELECT
  voice.titulo AS nome,
  COUNT(*) AS reproducoes
FROM SpotifyClone.cancao AS voice
INNER JOIN SpotifyClone.historico_reproducoes AS hr
ON voice.cancao_id = hr.cancao_id
INNER JOIN SpotifyClone.usuario AS usr
ON hr.usuario_id = usr.usuario_id
WHERE usr.plano_id IN (2, 3)
GROUP BY hr.cancao_id
ORDER BY nome ASC;
