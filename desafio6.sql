CREATE VIEW faturamento_atual AS (
  SELECT MIN(valor_plano) AS faturamento_minimo,
  MAX(valor_plano) AS faturamento_maximo,
  ROUND(AVG(valor_plano), 2) AS faturamento_medio,
  SUM(valor_plano) AS faturamento_total
  FROM 
  (
    SELECT usuarios.plano_id,
    planos.valor_plano
    FROM SpotifyClone.usuarios AS usuarios
    INNER JOIN SpotifyClone.planos AS planos ON (usuarios.plano_id = planos.plano_id)
  ) AS novaTabela
);
