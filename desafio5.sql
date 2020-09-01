CREATE VIEW top_2_hits_do_momento AS
SELECT M.nome AS `cancao`,
COUNT(HR.musica_id) AS `reproducoes`
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.historico_reproducao AS HR
ON HR.musica_id = M.id
GROUP BY M.nome ORDER BY `reproducoes` DESC, `cancao` ASC LIMIT 2;



-- SELECT * FROM top_2_hits_do_momento;
