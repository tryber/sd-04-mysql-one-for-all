create view cancoes_premium as
select m.nome_musica nome, count(h.musica_id) reproducoes
from SpotifyClone.musicas m
inner join SpotifyClone.historicos h on h.musica_id=m.musica_id
inner join SpotifyClone.usuarios u on u.usuario_id = h.usuario_id and (u.plano_id=2 or u.plano_id=3)
group by nome order by nome;
