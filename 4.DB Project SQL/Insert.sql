USE [MusicPlatform]

INSERT INTO _User(Email,NickName,_Password,BirthYear,BirthMonth,BirthDay,sex,SubscriptionType)
VALUES('email0@gmail.com','nickname0','000000',2001,1,1,'Male','Free'),
('email1@gmail.com','nickname1','111111',2003,1,1,'Male','Free'),
('email2@gmail.com','nickname2','222222',2003,2,2,'Female','Free'),
('email3@gmail.com','nickname3','333333',2004,3,3,'Male','Premium'),
('email4@gmail.com','nickname4','444444',2005,4,4,'Female','Premium'),
('email5@gmail.com','nickname5','555555',2006,5,5,'Male','Premium'),
('email6@gmail.com','nickname6','666666',2007,6,6,'Female','Free'),
('email7@gmail.com','nickname7','777777',2008,7,7,'Male','Premium'),
('email8@gmail.com','nickname8','888888',2009,8,8,'Male','Premium');


INSERT INTO Audio(Audio_id,AudioName,AudioLength,EmailUser,Lyric,TheDateOfRelease)
VALUES(1,'Music1','00:03:20','email1@gmail.com','lyrics1','2022-06-01'),
(2,'podcast1','01:30:00','email3@gmail.com','lyrics2','2021-11-01'),
(3,'Music2','00:03:11','email2@gmail.com','lyrics3','2022-06-01'),
(4,'Podcast2','01:12:00','email3@gmail.com','lyrics4','2023-02-01'),
(5,'Music3','00:03:44','email1@gmail.com','lyrics5','2022-06-01'),
(6,'Podcast3','00:57:10','email3@gmail.com','lyrics6','2023-05-02'),
(7,'Music4','00:02:48','email2@gmail.com','lyrics7','2022-06-01'),
(8,'Podcast4','00:48:34','email3@gmail.com','lyrics8','2021-09-23'),
(9,'Music5','00:04:01','email4@gmail.com','lyrics9','2020-12-01');

--Album for Single songs id =0
INSERT INTO Album(Album_id,AlbumName,Artist,TheDateOfRelease,Description)
VALUES(1,'Album1','email1@gmail.com','2022-06-01','AlbumDescription1'),
(2,'Album1','email1@gmail.com','2022-06-01','AlbumDescription1'),
(0,'SingleSongs','email0@gmail.com','2022-10-01','AlbumDescription2');


INSERT INTO Music(Audio_id,Instrumental,Description,Language,ReleaseType,Album_id,genre)
VALUES(1,0,'MusicDescription1','English',1,1,'Rock'),
(3,0,'MusicDescription2','Spanish',1,1,'Jazz'),
(5,0,'MusicDescription3','Persian',1,1,'R&B'),
(7,0,'MusicDescription4','English',1,1,'Dubstep'),
(9,1,'MusicDescription5',' ',0,0,'Country');

INSERT INTO Playlist(Playlist_id,PlaylistName,TheDateOfTheLastUpdate,creator)
VALUES(1,'PlaylistName1','2023-02-22','email4@gmail.com'),
(2,'PlaylistName2','2023-02-26','email5@gmail.com'),
(3,'PlaylistName3','2023-02-15','email6@gmail.com');


INSERT INTO Podcast(Audio_id,GuestName,GuestDescriptionAndBiography,PodcastTopic,Presenter)
VALUES(2,'Geust1','PodcastDescription1','Topic1','Presenter1'),
(4,'Geust2','PodcastDescription2','Topic2','Presenter1'),
(6,'Geust3','PodcastDescription3','Topic3','Presenter2'),
(8,'Geust4','PodcastDescription4','Topic4','Presenter2');

INSERT INTO Comment(Comment_id,CommentText,CommentDate,Audio_id,EmailUser)
VALUES(1,'CommentText1','2023-06-03',1,'email5@gmail.com'),
(2,'CommentText2','2023-04-02',5,'email6@gmail.com'),
(3,'CommentText3','2023-03-02',3,'email4@gmail.com'),
(4,'CommentText4','2023-02-02',3,'email5@gmail.com'),
(5,'CommentText5','2023-04-12',6,'email7@gmail.com'),
(6,'CommentText6','2023-03-01',6,'email6@gmail.com'),
(7,'CommentText7','2023-03-21',9,'email3@gmail.com');

INSERT INTO Follow(follower,followin)
VALUES('email1@gmail.com','email2@gmail.com'),
('email1@gmail.com','email3@gmail.com'),
('email1@gmail.com','email4@gmail.com'),
('email2@gmail.com','email1@gmail.com'),
('email3@gmail.com','email2@gmail.com'),
('email4@gmail.com','email2@gmail.com');

INSERT INTO LikePlaylist(Playlist_id,EmailUser)
VALUES(1,'email1@gmail.com'),
(1,'email2@gmail.com'),
(1,'email3@gmail.com'),
(1,'email4@gmail.com'),
(1,'email5@gmail.com'),
(2,'email2@gmail.com'),
(2,'email3@gmail.com'),
(2,'email4@gmail.com');

INSERT INTO ListenPlaylist(Playlist_id,EmailUser)
VALUES(1,'email7@gmail.com'),
(1,'email2@gmail.com'),
(1,'email2@gmail.com'),
(1,'email3@gmail.com'),
(1,'email4@gmail.com'),
(1,'email7@gmail.com'),
(1,'email5@gmail.com'),
(2,'email2@gmail.com'),
(2,'email3@gmail.com'),
(2,'email6@gmail.com'),
(3,'email4@gmail.com'),
(3,'email4@gmail.com');

INSERT INTO ListenAlbum(Album_id,EmailUser)
VALUES(1,'email1@gmail.com'),
(1,'email2@gmail.com'),
(1,'email2@gmail.com'),
(1,'email3@gmail.com'),
(1,'email4@gmail.com'),
(1,'email4@gmail.com'),
(1,'email5@gmail.com'),
(2,'email2@gmail.com'),
(2,'email3@gmail.com'),
(2,'email3@gmail.com'),
(2,'email4@gmail.com');

INSERT INTO MusicsOFAlbum(Audio_id,Album_id)
VALUES(1,1),
(3,1),
(5,1),
(7,1),
(9,0);

INSERT INTO CommentAlbum(Comment_id,Album_id)
VALUES(1,1),
(2,1),
(3,1),
(4,1),
(7,0);

INSERT INTO SingerAlbum(Album_id,Artist)
VALUES(1,'email2@gmail.com'),
(1,'email1@gmail.com');

INSERT INTO LanguageAlbum(Album_id,LanguageName)
VALUES(1,'English'),
(1,'Spanish'),
(1,'Persian');

INSERT INTO AudioCreatingPlaylist(Audio_id,Playlist_id,DateCreating)
VALUES(1,2,'2023-02-26'),
(3,2,'2023-02-26'),
(3,1,'2023-02-22'),
(5,1,'2023-02-22'),
(9,2,'2023-02-26');

INSERT INTO SeeMusiclyrics(Audio_id,UserEmail)
VALUES(9,'email6@gmail.com'),
(4,'email6@gmail.com'),
(3,'email4@gmail.com'),
(6,'email7@gmail.com'),
(2,'email6@gmail.com'),
(6,'email7@gmail.com'),
(2,'email7@gmail.com');

INSERT INTO LikeAudio(Audio_id,UserEmail)
VALUES(1,'email7@gmail.com'),
(1,'email2@gmail.com'),
(1,'email3@gmail.com'),
(1,'email4@gmail.com'),
(1,'email5@gmail.com'),
(1,'email6@gmail.com'),
(3,'email2@gmail.com'),
(3,'email3@gmail.com'),
(2,'email4@gmail.com'),
(4,'email2@gmail.com'),
(6,'email3@gmail.com'),
(4,'email4@gmail.com'),
(4,'email6@gmail.com'),
(8,'email5@gmail.com'),
(9,'email5@gmail.com'),
(9,'email4@gmail.com'),
(9,'email3@gmail.com'),
(9,'email2@gmail.com'),
(9,'email1@gmail.com');

INSERT INTO ListenAudio(Audio_id,UserEmail)
VALUES(1,'email7@gmail.com'),
(1,'email2@gmail.com'),
(1,'email2@gmail.com'),
(1,'email3@gmail.com'),
(1,'email4@gmail.com'),
(1,'email5@gmail.com'),
(1,'email6@gmail.com'),
(3,'email2@gmail.com'),
(3,'email2@gmail.com'),
(8,'email3@gmail.com'),
(8,'email3@gmail.com'),
(8,'email4@gmail.com'),
(6,'email5@gmail.com'),
(4,'email6@gmail.com'),
(4,'email6@gmail.com'),
(2,'email7@gmail.com'),
(2,'email4@gmail.com'),
(4,'email4@gmail.com'),
(3,'email5@gmail.com'),
(9,'email5@gmail.com'),
(9,'email5@gmail.com'),
(9,'email4@gmail.com'),
(9,'email3@gmail.com'),
(9,'email2@gmail.com'),
(9,'email2@gmail.com'),
(9,'email1@gmail.com');

INSERT INTO Producer(Album_id,producername)
VALUES(1,'Producer1'),
(1,'Producer2'),
(1,'Producer3'),
(1,'Producer4'),
(2,'Producer1'),
(2,'Producer5');

INSERT INTO Singers(Audio_id,SingersName)
VALUES(7,'email8@gmail.com'),
(9,'email7@gmail.com');
