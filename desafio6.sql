-- Create historico_reproducao_usuarios view
CREATE VIEW faturamento_atual AS (
    SELECT MIN(s.price) as faturamento_minimo,
        MAX(s.price) AS faturamento_maximo,
        ROUND(AVG(s.price), 2) AS faturamento_medio,
        SUM(s.price) AS faturamento_total
    FROM users AS u
        INNER JOIN subscriptions AS s ON s.subscription_id = u.subscription
);
