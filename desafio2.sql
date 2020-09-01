CREATE VIEW estatisticas_musicais AS
SELECT
(SELECT COUNT(*) FROM SpotifyClone.musicas) AS `cancoes`,
(SELECT COUNT(*) FROM SpotifyClone.artistas) AS `artistas`,
(SELECT COUNT(*) FROM SpotifyClone.albuns) AS `albuns`;


-- drop view estatisticas_musicais;

-- SELECT * FROM estatisticas_musicais;

-- SELECT COUNT(*) FROM SpotifyClone.musicas;
-- SELECT COUNT(*) FROM SpotifyClone.artistas;
-- SELECT COUNT(*) FROM SpotifyClone.albuns;
