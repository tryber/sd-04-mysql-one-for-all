CREATE VIEW estatisticas_musicais AS 
SELECT COUNT(song_name) `cancoes` 
,(SELECT COUNT(artist_name) FROM artist) `artistas`
,(SELECT COUNT(album_name) FROM album) `albuns`
FROM songs;
