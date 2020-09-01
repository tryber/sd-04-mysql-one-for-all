CREATE VIEW cancoes_premium AS
select can.cancao AS nome, COUNT(his.usuario_id) AS reproducoes
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.historico_de_reproducoes AS his
ON can.cancao_id = his.cancao_id AND his.usuario_id IN (2, 3)
GROUP BY can.cancao
ORDER BY can.cancao;
