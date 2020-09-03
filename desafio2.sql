
CREATE VIEW estatisticas_musicais AS
SELECT count(DISTINCT c.cancoes_name) AS cancoes ,
count(DISTINCT a.artistas_name) AS artistas ,
count(DISTINCT al.album_name) AS albuns
FROM SpotifyClone.cancoes as c, SpotifyClone.artistas  as a, SpotifyClone.album  as al;
