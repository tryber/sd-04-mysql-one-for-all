CREATE VIEW top_2_hits_do_momento AS
  SELECT
    c.nome cancao,
    COUNT(*) reproducoes
  FROM
    SpotifyClone.cancoes c,
    SpotifyClone.historico_reproducoes hr
  WHERE
    c.id = hr.cancoes_id
  GROUP BY
    cancao
  ORDER BY
    reproducoes DESC,
    cancao
  LIMIT
    2;
