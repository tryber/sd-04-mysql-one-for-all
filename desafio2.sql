
CREATE VIEW estatisticas_musicais AS (
    SELECT
        (SELECT COUNT(id) FROM SpotifyClone.song) AS cancoes,
        (SELECT COUNT(id) FROM SpotifyClone.artist) AS artistas,
        (SELECT COUNT(id) FROM SpotifyClone.album) AS albuns
);