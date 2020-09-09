select m.nome_musica as cancao, count(h.usuario_id) as reproducoes
from SpotifyClone.musicas m
inner join SpotifyClone.historicos h on h.musica_id = m.musica_id
group by cancao
order by reproducoes desc, cancao limit 2;
