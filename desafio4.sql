CREATE VIEW top_3_artistas AS
SELECT a.artista, count(*) AS seguidores FROM usuarios u 
INNER JOIN usuarios_artista ua ON ua.id_usuario = u.id_usuario 
INNER JOIN artistas a ON ua.id_artista = a.id_artista
GROUP BY a.artista
ORDER BY seguidores DESC, a.artista
LIMIT 3;
