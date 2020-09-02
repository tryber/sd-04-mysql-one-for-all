CREATE VIEW cancoes_premium AS
SELECT M.nome AS `nome`,
COUNT(HR.usuario_id) AS `reproducoes`
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.historico_reproducao AS HR
ON M.id = HR.musica_id
INNER JOIN SpotifyClone.usuarios AS U
ON HR.usuario_id = U.id
WHERE U.plano_id in (2,3)
GROUP BY M.nome ORDER BY M.nome; 

-- SELECT * FROM cancoes_premium;
