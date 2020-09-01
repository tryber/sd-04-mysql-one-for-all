USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
    (SELECT USE SpotifyClone;

DROP VIEW estatisticas_musicais;

CREATE VIEW estatisticas_musicais AS (
  SELECT
    (SELECT
      COUNT(*)
    FROM
      SpotifyClone.cancoes) AS cancoes,
    (SELECT
      COUNT(*)
    FROM
      SpotifyClone.artistas) AS artistas,
    (SELECT
      COUNT(*)
    FROM
      SpotifyClone.albuns) AS albuns
);

        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.cancoes) AS cancoes,
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.artistas) AS artistas,
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.albuns) AS albuns
    );
