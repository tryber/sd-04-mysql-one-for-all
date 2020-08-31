CREATE VIEW faturamento_atual AS
SELECT
  (
    SELECT
      Round(MIN(p.valor), 2)
    FROM
      SpotifyClone.usuarios AS u
      INNER JOIN SpotifyClone.planos AS p ON p.plano_id = u.plano_id
  ) AS 'faturamento_minimo',
  (
    SELECT
      round(MAX(p.valor), 2)
    FROM
      SpotifyClone.usuarios AS u
      INNER JOIN SpotifyClone.planos AS p ON p.plano_id = u.plano_id
  ) AS 'faturamento_maximo',
  (
    SELECT
      round(AVG(p.valor), 2)
    FROM
      SpotifyClone.usuarios AS u
      INNER JOIN SpotifyClone.planos AS p ON p.plano_id = u.plano_id
  ) AS 'faturamento_medio',
  (
    SELECT
      round(SUM(p.valor), 2)
    FROM
      SpotifyClone.usuarios AS u
      INNER JOIN SpotifyClone.planos AS p ON p.plano_id = u.plano_id
  ) AS 'faturamento_total';
