CREATE VIEW faturamento_atual AS
  SELECT
    ROUND(MIN(p.valor), 2) faturamento_minimo,
    ROUND(MAX(p.valor), 2) faturamento_maximo,
    ROUND(AVG(p.valor), 2) faturamento_medio,
    ROUND(SUM(p.valor), 2) faturamento_total
  FROM
    SpotifyClone.planos p,
    SpotifyClone.usuarios u
  WHERE
    p.id = u.planos_id;
