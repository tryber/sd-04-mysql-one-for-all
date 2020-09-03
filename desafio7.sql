CREATE VIEW perfil_artistas AS
SELECT ar.artist_name `artista`, al.album_name `album`, COUNT(user_id) `seguidores`
FROM artist ar
INNER JOIN album al, following f 
WHERE ar.id = al.artist_id AND ar.id = f.artist_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista` ASC, `album` ASC;
