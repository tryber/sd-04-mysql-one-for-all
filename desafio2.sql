CREATE VIEW estatisticas_musicais AS
SELECT
  count(cancao_id) AS songs,
  (
    SELECT
      count(artist_id)
    FROM
      SpotifyClone.artists
  ) AS artists,
  (
    SELECT
      count(album_id)
    FROM
      SpotifyClone.albuns
  ) AS albuns
FROM
  SpotifyClone.songs;
