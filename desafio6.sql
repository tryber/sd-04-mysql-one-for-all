-- Create faturamento_atual view
CREATE VIEW faturamento_atual AS (
    SELECT MAX(s.price) AS faturamento_maximo,
        ROUND(AVG(s.price), 2) AS faturamento_medio,
        MIN(s.price) as faturamento_minimo,
        SUM(s.price) AS faturamento_total
    FROM users AS u
        INNER JOIN subscriptions AS s ON s.subscription_id = u.subscription
);
