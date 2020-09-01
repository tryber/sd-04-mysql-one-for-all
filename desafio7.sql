CREATE VIEW perfil_artists AS
SELECT
  (
    SELECT
      name
    FROM
      SpotifyClone.artists
    WHERE
      artists.artist_id = albuns.artist_id
  ) AS artista,
  name AS album,
  (
    SELECT
      COUNT(*)
    FROM
      SpotifyClone.following
    WHERE
      following.artist_id = albuns.artist_id
  ) AS seguidores
FROM
  SpotifyClone.albuns
ORDER BY
  seguidores DESC,
  artista,
  album;
