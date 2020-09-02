CREATE VIEW estatisticas_musicais AS
SELECT 
COUNT(c.id_cancao) AS cancoes,
(
SELECT
COUNT(a.id_artista)
FROM SpotifyClone.artista AS a
) AS artistas,
(
SELECT
COUNT(al.id_album)
FROM SpotifyClone.album AS al
) AS albuns
FROM SpotifyClone.cancao AS c;
