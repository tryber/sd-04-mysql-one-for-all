CREATE VIEW top_2_hits_do_momento AS
SELECT
M.nome AS `cancao`,
COUNT(HR.musica_id) AS `reproducoes`
FROM SpotifyClone.historico_reproducoes AS HR
JOIN SpotifyClone.musica AS M
WHERE HR.musica_id = M.id
GROUP BY HR.musica_id
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
