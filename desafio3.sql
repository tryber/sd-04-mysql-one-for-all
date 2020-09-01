CREATE VIEW historico_reproducao_usuarios AS
SELECT
  usr.nome AS usuario,
  voice.titulo AS nome
FROM SpotifyClone.historico_reproducoes AS hr
INNER JOIN SpotifyClone.usuario AS usr
ON hr.usuario_id = usr.usuario_id
INNER JOIN SpotifyClone.cancao AS voice
ON hr.cancao_id = voice.cancao_id
ORDER BY usr.nome ASC, voice.titulo ASC;
