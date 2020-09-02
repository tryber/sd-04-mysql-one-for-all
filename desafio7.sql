CREATE TABLE perfil_artistas AS
SELECT
(
SELECT
a.nome_artista
FROM SpotifyClone.artista AS a
WHERE a.id_artista = al.id_artista
) AS artista,
nome_album AS album,
(
SELECT
COUNT(au.id_artista)
FROM SpotifyClone.artista_usuario AS au
GROUP BY id_artista
HAVING au.id_artista = al.id_artista
) AS seguidores
FROM SpotifyClone.album AS al
ORDER BY seguidores DESC, artista, album;
