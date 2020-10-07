CREATE VIEW estatisticas_musicais AS 
  SELECT 
  (SELECT COUNT(titulo_cancoes) FROM SpotifyClone.cancoes) AS cancoes,
  (SELECT COUNT(nome_artista) FROM SpotifyClone.artistas) AS artistas,
  (SELECT COUNT(titulo_album) FROM SpotifyClone.albuns) AS albuns;
