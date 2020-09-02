CREATE VIEW top_2_hits_do_momento
AS
  SELECT
    c.nome AS cancao,
    (SELECT
      COUNT(*)
    FROM
      usuarios_cancoes AS uc
    WHERE
            uc.cancao_id = c.id) AS reproducoes
  FROM
    cancoes AS c
  ORDER BY reproducoes DESC , cancao
LIMIT 2;
