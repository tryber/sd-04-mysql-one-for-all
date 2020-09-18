CREATE VIEW top_2_hits_do_momento AS (
  SELECT SpotifyClone.cacoes.cancao_nome AS cancao,
  (
    SELECT COUNT(*) FROM SpotifyClone.historico AS historico
    WHERE (historico.cancao_id = cancoes.cancao_id)
  ) AS reproducoes
  FROM SpotifyClone.cancoes AS cancoes
  ORDER BY reproducoes DESC, cancao
  LIMIT 2
);
