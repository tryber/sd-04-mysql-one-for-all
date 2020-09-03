CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(valores) AS faturamento_minimo,
        MAX(valores) AS faturamento_maximo,
        ROUND(AVG(valores), 2) AS faturamento_medio,
        SUM(valores) AS faturamento_total
    FROM
        (SELECT 
            valor AS valores
        FROM
            usuario u
        JOIN plano p ON p.id = u.plano_id) AS tabela_valores;
