CREATE VIEW perfil_artistas AS
  SELECT artists.name AS artista, a.name AS album, COUNT(*) as seguidores FROM artists
  INNER JOIN albums AS a
  ON a.artist_id = artists.artist_id
  INNER JOIN followers AS f
  ON a.artist_id = f.artist_id
  GROUP BY a.name, artists.name
  ORDER BY seguidores DESC, artista, album;
