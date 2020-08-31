USE SpotifyClone;
CREATE VIEW top_3_artistas AS
SELECT 
A.nome_artista AS `artista`,
COUNT(ArtSe.artista_id) AS `seguidores`
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.artista_seguindo AS ArtSe WHERE A.id = ArtSe.artista_id
GROUP BY ArtSe.artista_id
ORDER BY `seguidores` DESC LIMIT 3;

SELECT * FROM top_3_artistas;