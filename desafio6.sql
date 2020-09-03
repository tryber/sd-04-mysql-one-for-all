CREATE VIEW faturamento_atual AS
SELECT MIN(plan_value) `faturamento_minimo`, MAX(plan_value) `faturamento_maximo`, 
ROUND(AVG(plan_value), 2) `faturamento_medio`, SUM(plan_value) `faturamento_total`  
FROM plan p 
INNER JOIN users u WHERE p.id = u.plan_id;
