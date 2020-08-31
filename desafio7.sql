CREATE VIEW perfil_artistas AS
SELECT
A.nome_artista AS `artista`,
AB.nome_do_album AS `album`,
COUNT(ArtS.artista_id) AS `seguidores`
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.artista_seguindo AS ArtS ON A.id = ArtS.artista_id
INNER JOIN SpotifyClone.album AS AB ON A.id = AB.artista_id
GROUP BY AB.id
ORDER BY `seguidores` DESC, `artista`, `album`;
