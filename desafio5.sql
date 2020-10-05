create view top_2_hits_do_momento
as select song.songs as cancao,
count(reproduction_history.user_id) as reproducoes
from song
inner join reproduction_history
on reproduction_history.song_id = song.song_id
group by song.songs
order by reproducoes desc, song.songs limit 2;
