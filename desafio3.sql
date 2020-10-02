
create view historico_reproducao_usuarios
as select name as usuario,
songs as nome
from user
inner join reproduction_history
on user.user_id = reproduction_history.user_id
inner join song
on song.song_id = reproduction_history.song_id
order by user.name,song.songs;
