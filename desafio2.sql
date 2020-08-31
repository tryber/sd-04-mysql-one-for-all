USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
SELECT COUNT(M.nome) AS `cancoes`,
COUNT(A.nome_artista) AS `artistas`,
COUNT(AB.nome_do_album) AS `albuns`
FROM SpotifyClone.musica AS M
INNER JOIN SpotifyClone.artista AS A
INNER JOIN SpotifyClone.album As AB;

SELECT * FROM estatisticas_musicais;