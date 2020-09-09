CREATE VIEW perfil_artistas AS
SELECT
a.nome artista,
al.titulo album,
COUNT(usa.usuario_id) seguidores
FROM
usuario_segue_artista usa
INNER JOIN
artista a ON
a.artista_id = usa.artista_id
INNER JOIN
album al ON
al.artista_id = a.artista_id
GROUP BY
artista,
album
ORDER BY
seguidores DESC,
artista,
album;
