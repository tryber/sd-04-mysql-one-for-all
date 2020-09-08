CREATE VIEW faturamento_atual AS (
  SELECT CAST(MAX(s.price) AS CHAR) AS faturamento_maximo,
	CAST(ROUND(AVG(s.price), 2)  AS CHAR) AS faturamento_medio,
  CAST(MIN(s.price) AS CHAR) as faturamento_minimo,
  CAST(SUM(s.price) AS CHAR) AS faturamento_total
  FROM SpotifyClone.users AS u
    INNER JOIN SpotifyClone.subscriptions AS s ON s.subscription_id = u.subscription
);
