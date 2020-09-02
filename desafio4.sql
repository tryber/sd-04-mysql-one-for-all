CREATE VIEW top_3_artistas AS
SELECT A.nome AS `artista`,
COUNT(UA.usuario_id) AS `seguidores`
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.usuario_artista AS UA
WHERE A.id = UA.artista_id
GROUP BY A.nome ORDER BY `seguidores` DESC, `artista`ASC LIMIT 3;


-- SELECT * FROM top_3_artistas;
