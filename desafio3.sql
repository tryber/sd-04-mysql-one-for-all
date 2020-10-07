CREATE VIEW historico_reproducao_usuarios AS
SELECT 
  usuario.nome_usuario, cancoes.titulo_cancoes AS nome
FROM
  SpotifyClone.historico_reproduçoes AS reproducoes
    LEFT JOIN
  SpotifyClone.usuario AS usuarios ON reproducoes.usuario_id = usuario.usuario_id
    LEFT JOIN
  SpotifyClone.cancoes AS cancoes ON cancoes.cancao_id = reproducoes.cancao_id
ORDER BY 1 , 2;