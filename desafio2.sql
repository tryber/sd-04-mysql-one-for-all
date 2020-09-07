CREATE VIEW estatisticas_musicais
AS
  (
  SELECT
    (SELECT COUNT(id)
    FROM SpotifyClone.cancoes) AS cancoes,
    (SELECT COUNT(id)
    FROM SpotifyClone.artistas) AS artistas,
    (SELECT COUNT(id)
    FROM SpotifyClone.albuns) AS albuns
);
