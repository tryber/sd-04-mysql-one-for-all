CREATE VIEW estatisticas_musicais AS
SELECT (SELECT COUNT(id) FROM SpotifyClone.cancao) AS cancoes,
(SELECT COUNT(id) FROM SpotifyClone.artista) AS artistas,
(SELECT COUNT(id) FROM SpotifyClone.album) AS albuns;
