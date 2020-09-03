CREATE VIEW estatisticas_musicais AS
  SELECT
    COUNT(nome) cancoes,
    (SELECT COUNT(nome) artistas FROM SpotifyClone.artistas) artistas,
    (SELECT COUNT(nome) albuns FROM SpotifyClone.albuns) albuns
  FROM
    SpotifyClone.cancoes;
