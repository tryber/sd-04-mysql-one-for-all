USE SpotifyClone;

CREATE VIEW estatisticas_musicas AS
SELECT
  (
    SELECT
      count(*)
    FROM
      cancoes
  ) AS cancoes,
  (
    SELECT
      count(*)
    FROM
      artistas
  ) AS artistas,
  (
    SELECT
      count(*)
    FROM
      albuns
  ) AS albuns;
