CREATE VIEW perfil_artistas AS
SELECT A.nome AS `artista`,
AL.nome AS `album`,
COUNT(UA.usuario_id) AS `seguidores`
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.albuns AS AL
ON A.id = AL.artista_id
INNER JOIn SpotifyClone.usuario_artista AS UA
ON A.id = UA.artista_id
GROUP BY AL.id ORDER BY `seguidores` DESC, `artista` ASC, `album` ASC;


-- SELECT * FROM perfil_artistas;
