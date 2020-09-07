-- Drop view if neccesary
DROP VIEW IF EXISTS estatisticas_musicais;

-- Create estatisticas_musicais view
CREATE VIEW estatisticas_musicais AS
SELECT (
        SELECT COUNT(song_id)
        FROM songs
    ) AS cancoes,
    (
        SELECT COUNT(artist_id)
        FROM artists
    ) AS artistas,
    (
        SELECT COUNT(album_id)
        FROM albuns
    ) AS albuns;
