CREATE VIEW historico_reproducao_usuarios AS
SELECT 
  usuarios.nome_usuario, cancoes.titulo_cancoes AS nome
FROM
  SpotifyClone.historico_reproducoes AS reproducoes
    LEFT JOIN
  SpotifyClone.usuarios AS usuarios ON reproducoes.usuario_id = usuarios.usuario_id
    LEFT JOIN
  SpotifyClone.cancoes AS cancoes ON cancoes.cancao_id = reproducoes.cancao_id
ORDER BY 1 , 2;
