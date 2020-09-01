CREATE VIEW faturamento_atual AS 
SELECT ROUND(MIN(plan.valor_plano), 2) AS 'faturamento_minimo',
ROUND(MAX(plan.valor_plano),2) AS 'faturamento_maximo',
ROUND(AVG(plan.valor_plano),2) AS 'faturamento_medio',
ROUND(SUM(plan.valor_plano),2) AS 'faturamento_total'
FROM SpotifyClone.planos AS plan
INNER JOIN SpotifyClone.usuarios AS usr ON plan.plano_id = usr.plano_id;

-- ========================================================================================
-- Créditos ao yoshi que me deu a luz sobre o inner join nesse caso. Valeu menino lindo! <3
-- ========================================================================================
