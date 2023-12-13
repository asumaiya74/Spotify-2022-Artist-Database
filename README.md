# Spotify 2022 Artist Database
- **Course:** INST 327 - Database Design and Modeling
- **Group Project By:** Aysha Sumaiya, Wince Glory, Anne Bezwada, and Nina D’Amico

## Introduction
The project is to create a music database that will provide users with information about their music catalog, allowing people to have an organized database that keeps track of their music and is organized based on various categories.
The project's scope is to cover every detail of the song completely. For example, the database will cover the basics of a song, such as _Song Name, Artist,_ and _Genre_. However, the database will also provide information that most people need to learn, such as _Producer, Company,_ or _Year of Release_. The reason for choosing this topic is because, as college students, students spend much time listening to music, and having a database where all of the song data is stored could be helpful.

## Project Plan 
The team meeting plan is to communicate through GroupMe to establish the best meeting times, and we will meet on Zoom every Monday at 5 PM to work on the project for an hour. The backup day will be Wednesday at 10 AM. Moreover, an additional day will be scheduled if needed.
Team members will divide work fairly and contribute equally to assignments. If a team member cannot complete the assigned part, they need to let the team know during scheduling so that it can be completed as a group. Team members will communicate actively and honestly. All the documents, files, and links will be shared through Google Drive, which everyone can access at any time and day.

## Project Milestone
The project milestone over the next three months is displayed below. We will have six major deadlines for this project that the team will follow. However, we will meet with the TA or the Professor between those due dates to get feedback on our progress. The project stages will be completed 3 days prior to the actual date. This will give us extra days if we are confused or have trouble with the project. 
![Project Milestones](https://github.com/asumaiya74/Spotify-2022-Artist-Database/assets/90868294/6c574354-7921-44b1-9776-c10c1dda2419)

## Database Description
Our database will allow people to see information regarding their music choices. The database will let users see the different kinds of music and artists they listen to. The  users will most likely be Spotify listeners. So, we will be able to provide information such as specific playlists, number of streams, and more. 
Their music will be organized by categories such as the artist, genre, album, etc. First we have the song table which includes information such as song name, run time, year released, etc. Next we have an Artist table which includes the artist name and number of albums. We additionally have a genre table which has various genres which are connected to a primary key. There is an album table which has the album name, artist, number of songs, year released, etc. The playlist table has the playlist name and the total songs in the playlist. Lastly, the producer table has information such as the producer name, company, as well as the artist associated with these values. We wanted to make sure that users can see all the different aspects and components of a song so we will even provide information about the producers, the record company,  and date of release. Since college students spend a lot of their time listening to music, we thought it would be a good idea to create a database that organizes all their data. On the next page you can see our ERD Diagram for our logical design. Below you can see our ERD Diagram draft.

## Target audience
Our target audience will mainly be those who listen to music often. Our music database will allow users to organize, manage, and search for music based on their preferences.

## Potential entities/tables with attributes/columns
| Entity/Table | Potential Attributes |
|----------|----------|
| Playlist Songs  | Song Name | 
| Genre | Pop, Rock, Rap, Hip hop, Country | 
| Playlist  | Playlist Name, Number of Songs, Followers  | 
| Producers | Producers name, Company name, Artist name, Song title  | 
| Artist | First name, Last name, Number of Albums, Monthly listeners |
| Song   | Song Name, Run Time, Artist Name, Album Name, Year released |
| Album  | Album Name, Genre, Artist, Number of Songs, Total run time, Year released  | 

 ## Logical Design
![Spotify 2022 Artist Database ERD](https://github.com/asumaiya74/Spotify-2022-Artist-Database/assets/90868294/812ef9f8-7ee9-485f-9ffa-da0101439620)

The main goal when creating our logical design was to ensure that each table could be mapped to one another. In order to ensure this, we created primary keys in every table as well as foreign keys in tables we believed to be necessary. “Artist_id” was an example of a foreign key where it was only necessary in tables such as “Album” ,”Song”, and “Producer”. Another example was the “genre_id” foreign key which would only make sense in the “Song” and “Album” tables. We wanted to not overdo it with the foreign keys and only use them in tables where it would make sense for it to be there.

## Physical Database
Our database is to help listeners on Spotify see what kind of music they listen to. It is made up of six tables which are Album, Song, Artist, Genre, Producer, and Playlist. We made sure to create tables that had relevant information which users would want to see. For example, if a user wanted to see what the genre of the album Lover by Taylor Swift is, they’d see that the genre_id is 1. So, you can go to the genre_id table and find that 1 means it is pop. We also wanted to make sure that users could learn about the producers of the songs they listen to which led us to creating the producers table. So, if someone wants to know the producer and the label in charge of a song/album, they can see who that is by looking at the producer_id and company_name. We made sure to think about what the user would want to know when creating the tables. See the file called "**spotify_db**"

## Entities/tables not included in the database 
- Song Rating
- Reviews
- Price of Song/Album
- Total number of streams

## Sample data 
For obtaining sample data, we used the Spotify Web API available to the public. It contains all real data regarding artists, albums, songwriters, producers, etc. We will use a portion of the data available as the sample and continue using it once we need the real data. The URL is:  https://developer.spotify.com/documentation/web-api/reference/#/. 

## Questions that the database will be able to answer
1. How many songs does a particular user own?
2. What is a particular user's favorite artist based on the total albums owned?
3. What is a particular user’s favorite genre based on albums owned?
4. What is the total number of albums owned by a particular artist?
5. How many playlists have songs from a particular artist?
6. How many playlists have songs from a particular genre?
7. What is the user's longest album/song?
8. How many songs does the user own from a particular time period?
9. How many artists share the same record label?
10. How many artists are under a particular genre?

## Changes from Original Design
The main changes from the original design were numerical values for columns such as Streams for a song or monthly listeners for an artist. This was something we initially wanted to include, however; since this number is constantly changing it was difficult to update this data every time the value does change. Other than that, our original design was kept the same. 

## Lessons Learned
Throughout this project there was a lot to learn about working in a group, especially a group that is working together remotely. Effective team communication was brought about by coming up with a specific schedule and time to meet every week to discuss any assignments as well as any problem we may be having. This level of organization created a well rounded work environment which allowed us to succeed on this project. We also learned about forward engineering ERD diagrams and how important it is to have your primary and foreign keys set prior to forward engineering. Lastly, we learned how to deal with data import issues by changing some settings in workbench to avoid possible errors.

