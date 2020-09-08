CREATE VIEW historico_reproducao_usuarios AS
  SELECT u.name AS usuario, s.title AS nome
  FROM users AS u, songs AS s, playback_history AS pb
  WHERE u.id = pb.user AND s.id = pb.song
  ORDER BY u.name, s.title;
