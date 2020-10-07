CREATE VIEW cancoes_premium AS
SELECT 
  c.titulo_cancao AS 'nome', COUNT(hist.cancao_id) AS 'reproducoes'
  FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_reproducoes AS hist
  ON c.cancao_id = hist.cancao_id
INNER JOIN SpotifyClone.usuarios AS u 
  ON hist.usuario_id = u.usuario_id
  WHERE u.plano_id IN (2 , 3)
GROUP BY c.titulo_cancao ORDER BY 1;
