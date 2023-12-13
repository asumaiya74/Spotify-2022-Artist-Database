use spotify_db;

-- -----------------------------------------------------------------------
-- View query #1
-- This query joins the artists, album, genre, and producer table to show
-- the an artist's album and which company the artist is signed to
-- -----------------------------------------------------------------------
create view artist_album_label as
	select concat(a.first_name, ' ', a.last_name) as 'artist', al.album_name, g.genre_type, p.company_name
	from artists as a
	join album as al on a.artist_id = al.artist_id
	join genre as g on al.genre_id = g.genre_id
	left join producer as p on a.artist_id = p.artist_id
	group by a.last_name
	order by a.last_name;

select * from artist_album_label;

-- -----------------------------------------------------------------------
-- View query #2
-- This query shows the average number of songs in an album over the years
-- -----------------------------------------------------------------------
create view avg_num_songs as
	select year_released, avg(num_of_songs) as 'average number of songs'
    from album
	group by year_released
	order by year_released;

select * from avg_num_songs;

-- -----------------------------------------------------------------------
-- View query #3
-- This query joins the artists, genre, and album table
-- to the average number of monthly listeners there are for each genre
-- -----------------------------------------------------------------------
create view avg_montly_listeners as
	select g.genre_type as 'genre', format(avg(a.monthly_listeners),0) as 'average monthly listeners'
	from artists as a
	join album as al on a.artist_id = al.artist_id
	join genre as g on al.genre_id = g.genre_id
	group by g.genre_type
	order by a.monthly_listeners desc;
    
select * from avg_montly_listeners;

-- -----------------------------------------------------------------------
-- View query #4
-- This query joins the album, artist and genre table 
-- to show recently released albums
-- -----------------------------------------------------------------------
create view recent_albums as
	select al.album_name, concat(a.first_name,' ', a.last_name) as 'artist', 
		al.year_released, g.genre_type
        from album as al
        join artists as a on al.artist_id = a.artist_id
        join genre as g on al.genre_id = g.genre_id
        where al.year_released > '2018'
        group by a.artist_id
        order by al.year_released;
        
select * from recent_albums;

-- -----------------------------------------------------------------------
-- View query #5
-- This query joins the song, artists, genre, and playlist table
-- to show songs from that appear in various playlists
-- -----------------------------------------------------------------------
create view playlist_songs as 
	select s.song_name, s.album_name, s.year_released, concat(a.first_name,' ', a.last_name) as 'artist',
		g.genre_type as 'genre', p.playlist_name as 'playlist name'
    from song as s
    join artists as a on s.artist_id = a.artist_id
    join genre as g on s.genre_id = g.genre_id
    join playlist as p on s.playlist_id = p.playlist_id
    where g.genre_type = 'pop'
    order by s.song_name;
    
select * from playlist_songs;

-- -----------------------------------------------------------------------
-- View query #6
-- This query shows producers that have artists with more than 10 albums signed to their company
-- -----------------------------------------------------------------------
create view producer_info as 
	select concat(producer_fname, ' , ', producer_lname) as 'Producer Name',
    artist_id,
    company_name
    from Producer
    where artist_id in (select artist_id from artists where num_of_albums < 10)
    order by company_name;

-- -----------------------------------------------------------------------
-- View query #7
-- This query shows the minimum number of songs per genre type
-- -----------------------------------------------------------------------
CREATE VIEW min_num_song AS 
SELECT 
	MIN(Album.num_of_songs) AS 'Number of Song',
	Album.album_name AS 'Album Name',
	Genre.genre_type AS 'Genre Type'
FROM Album
	JOIN Genre USING (genre_id)
    JOIN Artists USING (artist_id)
GROUP BY Genre.genre_type
ORDER BY num_of_songs;




