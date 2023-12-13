# Spotify 2022 Artist Database
- **Course:** INST 327 - Database Design and Modeling
- **Group Project By:** Aysha Sumaiya, Wince Glory, Anne Bezwada, and Nina D’Amico

## Introduction
Our idea for the project is to create a music database. This database will provide users with information about their own individual music catalog. This will allow people to have an organized database that keeps track of their music and is organized based on various categories.
The scope of our project is to completely cover every end of a song. For example, the database will cover the basics of a song, such as Song Name, Artist, and Genre. However, our database will also provide information that most people need to learn, such as Producer, Company, or year of release. We chose this topic because, as college students, we spend a lot of time listening to music and having a database where all of our song data is stored could be helpful.

## Target audience:  
Our target audience will mainly be those who listen to music often. Our music database will allow users to organize, manage, and search for music based on their preferences.

## Sample data:  
For sample data, we plan to use the Spotify Web API available to the public. It contains all real data regarding artists, albums, songwriters, producers, etc. We will use some of the data available as the sample and continue using it once we need the real data. The URL is https://developer.spotify.com/documentation/web-api/reference/#/. 

## Potential entities/tables with attributes/columns:  
| Entity/Table | Potential Attributes |
|----------|----------|
| Playlist Songs  | Song Name | 
| Genre | Pop, Rock, Rap, Hip hop, Country | 
| Playlist  | Playlist Name, Number of Songs, Followers  | 
| Producers | Producers name, Company name, Artist name, Song title  | 
| Artist | First name, Last name, Number of Albums, Monthly listeners |
| Song   | Song Name, Run Time, Artist Name, Album Name, Year released |
| Album  | Album Name, Genre, Artist, Number of Songs, Total run time, Year released  | 

## Entities/tables not included in the database:  
- Song Rating
- Reviews
- Price of Song/Album
- Total number of streams

## Questions that the database will be able to answer:  
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

