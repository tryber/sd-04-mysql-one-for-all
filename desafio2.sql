CREATE VIEW estatisticas_musicais AS
SELECT
  count(cancao_id) AS cancoes,
  (
    SELECT
      count(artist_id)
    FROM
      SpotifyClone.artists
  ) AS artistas,
  (
    SELECT
      count(album_id)
    FROM
      SpotifyClone.albuns
  ) AS albuns
FROM
  SpotifyClone.songs;
