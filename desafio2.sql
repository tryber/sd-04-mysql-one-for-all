CREATE VIEW estatisticas_musicais AS
SELECT 
(SELECT COUNT(*) FROM SpotifyClone.cancoes) AS cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artistas) AS artistas,
(SELECT COUNT(*) FROM SpotifyClone.albuns) AS albuns;
