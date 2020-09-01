CREATE VIEW top_2_hits_do_momento AS
SELECT
  voice.titulo AS cancao,
  COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.historico_reproducoes AS hr
INNER JOIN SpotifyClone.cancao AS voice
ON hr.cancao_id = voice.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
