CREATE VIEW faturamento_atual AS
SELECT 
FORMAT(MIN(valor_plano), 2) AS faturamento_minimo,
FORMAT(MAX(valor_plano), 2) AS faturamento_maximo,
FORMAT(AVG(valor_plano), 2) AS faturamento_medio,
FORMAT(SUM(valor_plano), 2) AS faturamento_total FROM usuarios u 
INNER JOIN planos p ON u.id_plano = p.id_plano;
