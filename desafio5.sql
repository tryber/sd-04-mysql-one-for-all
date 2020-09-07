
CREATE VIEW top_2_hits_do_momento
AS
  SELECT
    c.nome AS cancao,
    (SELECT COUNT(*)
    FROM SpotifyClone.usuarios_cancoes AS uc
    WHERE uc.cancao_id = c.id) AS reproducoes
  FROM
    SpotifyClone.cancoes AS c
  ORDER BY reproducoes DESC , cancao
LIMIT 2;
