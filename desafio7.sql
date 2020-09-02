CREATE VIEW perfil_artistas
AS
  (
  SELECT
    (SELECT
      nome
    FROM
      artistas
    WHERE
            artistas.id = albuns.artista_id) AS artista,
    nome AS album,
    (SELECT
      COUNT(*)
    FROM
      usuarios_artistas
    WHERE
            usuarios_artistas.artista_id = albuns.artista_id) AS seguidores
  FROM
    albuns
  ORDER BY seguidores DESC , artista , album
);
