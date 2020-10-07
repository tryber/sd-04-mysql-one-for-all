CREATE VIEW estatisticas_musicais AS
SELECT
  count(cancao_id) AS 'cancoes',
  (SELECT
    count(artista_id) FROM SpotifyClone.artistas) AS 'artistas',
  (SELECT
    count(album_id) FROM SpotifyClone.albuns) AS 'albuns' FROM SpotifyClone.cancoes;

-- Conta cancoes por cancao_id
-- Conta artista por artista_id
-- Conta albuns por album_id
