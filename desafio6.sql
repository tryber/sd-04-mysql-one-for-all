CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(p.valor_plano) faturamento_minimo,
        MAX(p.valor_plano) faturamento_maximo,
        ROUND(AVG(p.valor_plano), 2) faturamento_medio,
        SUM(p.valor_plano) faturamento_total
    FROM
        usuarios u
            INNER JOIN
        planos p ON p.idplano = u.idplano;
