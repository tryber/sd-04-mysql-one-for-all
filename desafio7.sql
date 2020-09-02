CREATE VIEW perfil_artistas AS
SELECT 
a.artista, ab.album, count(*) AS seguidores FROM usuarios u 
INNER JOIN usuarios_artista ua ON ua.id_usuario = u.id_usuario 
INNER JOIN artistas a ON ua.id_artista = a.id_artista
INNER JOIN albuns ab ON a.id_artista = ab.id_artista
GROUP BY ab.album, a.artista
ORDER BY seguidores DESC, a.artista, ab.album;
