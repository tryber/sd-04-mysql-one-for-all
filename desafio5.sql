CREATE VIEW top_2_hits_do_momento AS
SELECT c.titulo AS 'cancao',
  (SELECT count(cancoes_id) FROM SpotifyClone.historico_reproducao
    WHERE cancoes_id = c.id
  ) AS 'reproducoes'
FROM SpotifyClone.cancoes AS c
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
