CREATE VIEW top_2_hits_do_momento AS
SELECT 
  c.titulo_cancao AS 'cancao', COUNT(historico.cancao_id) AS 'reproducoes'
FROM
  SpotifyClone.cancoes AS c
    INNER JOIN
  SpotifyClone.historico_reproducoes AS historico ON c.cancao_id = historico.cancao_id
GROUP BY historico.cancao_id ORDER BY 2 DESC, 1 LIMIT 2;
