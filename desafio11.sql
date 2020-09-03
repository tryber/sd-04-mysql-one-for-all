CREATE VIEW cancoes_premium AS
SELECT s.name AS nome,
  COUNT(sh.user_id) AS reproducoes
FROM Songs_History AS sh
  JOIN Users AS u ON sh.user_id = u.id
  JOIN Songs AS s ON sh.song_id = s.id
WHERE u.plan_id > 1
GROUP BY nome
ORDER BY nome;
