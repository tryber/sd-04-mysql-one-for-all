USE SpotifyClone;

CREATE VIEW estatiscas_musicas AS
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
