CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT son.song_id) AS cancoes,
COUNT(DISTINCT art.artist_id) AS artistas,
COUNT(DISTINCT alb.album_id) AS albuns
FROM artist AS art
INNER JOIN album AS alb
ON art.artist_id = alb.artist_id
INNER JOIN song AS son
ON son.album_id = alb.album_id;
