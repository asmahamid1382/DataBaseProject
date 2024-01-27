USE [MusicPlatform2]

-- _User Table
INSERT INTO _User (Email, ProfilePhoto, _Password, sex, FirstName, LastName, NickName, SubscriptionType, FollowersNumber, StreamCollectionOfAllSounds, BirthYear, BirthMonth, BirthDay)
VALUES
('user1@example.com', NULL, 'password123', 'Male', 'John', 'Doe', 'JD', 'Premium', 100, 500, 1990, 5, 15),
('user2@example.com', NULL, 'pass4562', 'Female', 'Alice', 'Smith', 'AS', 'Free', 50, 200, 1985, 8, 21),
('user3@example.com', NULL, 'pass7891', 'Male', 'Bob', 'Johnson', 'BJ', 'Premium', 120, 700, 1988, 11, 8);

-- Playlist Table
INSERT INTO Playlist (Playlist_id, Cover, TheDateOfTheLastUpdate, PlaylistName, LikePlaylistNumber, NumberOfAudios, creator)
VALUES
(1, NULL, '2023-01-10', 'Workout Mix', 20, 15, 'user1@example.com'),
(2, NULL, '2023-02-05', 'Chill Vibes', 15, 20, 'user2@example.com'),
(3, NULL, '2023-03-12', 'Road Trip Tunes', 25, 18, 'user3@example.com');


-- Album Table
INSERT INTO Album (Album_id, Cover, TheDateOfRelease, Description, AlbumName, Artist)
VALUES
(1, NULL, '2023-03-20', 'Debut Album', 'First Sounds', 'user1@example.com'),
(2, NULL, '2023-04-15', 'Jazz Fusion', 'Harmony Beats', 'user2@example.com'),
(3, NULL, '2023-05-02', 'Pop Sensation', 'Pop Party', 'user3@example.com');

-- Podcast Table
INSERT INTO Podcast (podcast_id, Presenter, PodcastTopic, EmailUser, PodcastLength, TheDateOfRelease, LikePodcastNumber, Cover, PodcastName, StreamAmount, SponserNames, Producer)
VALUES
(1, 'Podcaster1', 'Tech Talk', 'user1@example.com', '00:30:00', '2023-05-12', 50, NULL, 'Tech Insights', 1000, 'Company A, Company B', 'Producer1'),
(2, 'Podcaster2', 'Science Hour', 'user2@example.com', '00:45:00', '2023-06-18', 40, NULL, 'Science Explorations', 800, 'Company C, Company D', 'Producer2'),
(3, 'Podcaster3', 'Business Chat', 'user3@example.com', '00:40:00', '2023-07-05', 35, NULL, 'Corporate Trends', 600, 'Company E, Company F', 'Producer3');


-- PodcastGuest Table
INSERT INTO PodcastGuest (podcast_id, GuestName, GuestDescriptionAndBiography)
VALUES
(1, 'Guest1', 'Tech enthusiast and expert in artificial intelligence.'),
(3, 'Guest2', 'Software engineer with a passion for innovation.'),
(2, 'Guest3', 'Biologist specializing in marine life research.');

-- Music Table
INSERT INTO Music (Music_id, Instrumental, Genre, TrackNumber, Language, ReleaseType, Album_id, MusicLength, TheDateOfRelease, LikeMusicNumber, Cover, MusicName, Lyric, StreamAmount, EmailUser)
VALUES
(1, 1, 'Rock', 1, 'English', 1, 1, '00:04:30', '2023-08-10', 50, NULL, 'Rock Anthem', 'Verse 1: ...', 1000, 'user1@example.com'),
(2, 0, 'Jazz', 3, 'English', 0, 2, '00:05:15', '2023-09-22', 40, NULL, 'Smooth Jazz', 'Instrumental track with saxophone.', 800, 'user2@example.com'),
(3, 1, 'Pop', 2, 'English', 1, 3, '00:03:45', '2023-10-15', 35, NULL, 'Pop Groove', 'Catchy chorus and upbeat rhythm.', 600, 'user3@example.com');

-- Comment Table
INSERT INTO Comment (Comment_id, LikeNumber, CommentText, CommentDate, Audio_id, EmailUser)
VALUES
(1, 10, 'Great track! Love the guitar solo.', '2023-08-12', 1, 'user1@example.com'),
(2, 5, 'Smooth jazz at its finest.', '2023-09-25', 2, 'user2@example.com'),
(3, 8, 'Catchy pop melody!', '2023-10-18', 3, 'user3@example.com');


-- Concert Table
INSERT INTO Concert (Concert_id, Concert_Name, venue_Name, Dateofconcert, timeofconcert, ArtistEmail)
VALUES
(1, 'Summer Jam', 'Outdoor Arena', '2023-07-30', '19:00:00', 'user1@example.com'),
(2, 'Jazz Night', 'City Jazz Club', '2023-08-15', '20:30:00', 'user2@example.com'),
(3, 'Pop Festival', 'Main Stadium', '2023-09-05', '18:45:00', 'user3@example.com');

-- Ticket Table
INSERT INTO Ticket (Ticket_id, NumberofChair, cost, Tickettype, Concert_id, UserEmail)
VALUES
(1, 50, 30, 1, 1, 'user1@example.com'),
(2, 30, 25, 2, 2, 'user2@example.com'),
(3, 40, 20, 1, 3, 'user3@example.com');

-- MusicVideo Table
INSERT INTO MusicVideo (MusicVideo_id, MuiscvideoName, Lengthofvideo, ReleaseDate, StreamAmount, LikeMusicVideoNumber, UserEmail)
VALUES
(1, 'Rock Anthem MV', '00:05:30', '2023-08-20', 500, 50, 'user1@example.com'),
(2, 'Jazz Jam Session', '00:06:45', '2023-09-30', 400, 40, 'user2@example.com'),
(3, 'Pop Groove Visuals', '00:04:15', '2023-10-25', 300, 35, 'user3@example.com');

-- Supervisor Table
INSERT INTO Supervisor (supervisor_id, Email, FirstName, LastName, sex, SupervisionOrder)
VALUES
(1, 'supervisor1@example.com', 'Supervisor', 'One', 'Boy', 'Order A'),
(2, 'supervisor2@example.com', 'Supervisor', 'Two', 'Girl', 'Order B'),
(3, 'supervisor3@example.com', 'Supervisor', 'Three', 'Boy', 'Order C');

-- Request Table
INSERT INTO Request (Request_id, Subjectofrequest, TextofRequest, SubmitDate, supervisor_answer, Checked, UserEmail, Music_id, supervisor_id)
VALUES
(1, 'Licensing Request', 'Requesting permission to use the track in a commercial project.', '2023-08-05', 'Approved', 1, 'user1@example.com', 1, 1),
(2, 'Collaboration Proposal', 'Interested in collaborating on a new music project.', '2023-09-10', 'Under Review', 2, 'user2@example.com', 2, 2),
(3, 'Performance Inquiry', 'Requesting information about booking the artist for an event.', '2023-10-02', 'Rejected', 2, 'user3@example.com', 3, 3);

-- Follow Table
INSERT INTO Follow (follower, followin)
VALUES
('user1@example.com', 'user2@example.com'),
('user2@example.com', 'user3@example.com'),
('user3@example.com', 'user1@example.com');


-- LikePlaylist Table
INSERT INTO LikePlaylist (EmailUser, Playlist_id)
VALUES
('user1@example.com', 1),
('user2@example.com', 2),
('user3@example.com', 3);


-- ListenPlaylist Table
INSERT INTO ListenPlaylist (EmailUser, Playlist_id)
VALUES
('user1@example.com', 2),
('user2@example.com', 3),
('user3@example.com', 1);


-- ListenAlbum Table
INSERT INTO ListenAlbum (EmailUser, Album_id)
VALUES
('user1@example.com', 1),
('user2@example.com', 2),
('user3@example.com', 3);

-- LanguageAlbum Table
INSERT INTO LanguageAlbum (Album_id, LanguageName)
VALUES
(1, 'English'),
(1, 'Spanish'),
(2, 'French'),
(2, 'German'),
(3, 'Italian');

-- SeeMusicLyrics Table
INSERT INTO SeeMusicLyrics (UserEmail, Music_id)
VALUES
('user1@example.com', 1),
('user2@example.com', 2),
('user3@example.com', 3);

-- LikeMusic Table
INSERT INTO LikeMusic (UserEmail, Music_id)
VALUES
('user1@example.com', 1),
('user2@example.com', 2),
('user3@example.com', 3);

-- ListenMusic Table
INSERT INTO ListenMusic (UserEmail, Music_id)
VALUES
('user1@example.com', 2),
('user2@example.com', 3),
('user3@example.com', 1);


-- LikePodcast Table
INSERT INTO LikePodcast (UserEmail, Podcast_id)
VALUES
('user1@example.com', 1),
('user2@example.com', 2),
('user3@example.com', 3);

-- ListenPodcast Table
INSERT INTO ListenPodcast (UserEmail, Podcast_id)
VALUES
('user1@example.com', 2),
('user2@example.com', 3),
('user3@example.com', 1);

-- LikeMusicVideo Table
INSERT INTO LikeMusicVideo (UserEmail, MusicVideo_id)
VALUES
('user1@example.com', 1),
('user2@example.com', 2),
('user3@example.com', 3);
-- Add 7 more rows...

-- ListenMusicVideo Table
INSERT INTO ListenMusicVideo (UserEmail, MusicVideo_id)
VALUES
('user1@example.com', 2),
('user2@example.com', 3),
('user3@example.com', 1);
-- Add 7 more rows...
-- AudioCreatingPlaylist Table
INSERT INTO AudioCreatingPlaylist (Playlist_id, DateCreating, Audio_id)
VALUES
(1, '2023-08-15', 1),
(2, '2023-09-01', 2),
(3, '2023-10-10', 3);
-- Add 7 more rows...

-- Producer Table
INSERT INTO Producer (Album_id, producername)
VALUES
(1, 'ProducerX'),
(2, 'ProducerY'),
(3, 'ProducerZ');
-- Add 7 more rows...
