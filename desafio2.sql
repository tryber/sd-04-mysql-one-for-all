CREATE VIEW estatisticas_musicais AS
SELECT count(*) AS 'cancoes',
  (SELECT count(*) FROM SpotifyClone.artistas) AS 'artistas',
  (SELECT count(*) FROM SpotifyClone.albuns) AS 'albuns'
FROM SpotifyClone.cancoes;
