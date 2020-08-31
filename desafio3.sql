CREATE VIEW historico_reproducao_usuarios AS
SELECT
  SpotifyClone.usuario.nome AS usuario,
  SpotifyClone.cancao.nome AS nome
FROM
  SpotifyClone.usuario
  INNER JOIN SpotifyClone.playlist_history on SpotifyClone.usuario.id = SpotifyClone.playlist_history.usuario_id
  INNER JOIN SpotifyClone.cancao ON SpotifyClone.cancao.id = SpotifyClone.playlist_history.cancao_id
ORDER BY
  SpotifyClone.usuario.nome,
  SpotifyClone.cancao.nome;
