CREATE DATABASE MusicPlatform2

USE [MusicPlatform2]
Create TABLE _User(
	Email varchar(40) default'Deleted Acoount' ,
	ProfilePhoto varbinary(max) ,
	_Password varchar(15) not null,
	sex varchar(10) not null,
	FirstName varchar(40) not null , 
	LastName varchar(40) not null , 
	NickName varchar(20),
	SubscriptionType varchar(30) not null,
	FollowersNumber bigint DEFAULT 0,
	StreamCollectionOfAllSounds bigint DEFAULT 0,
	BirthYear bigint,
	BirthMonth int,
	BirthDay int,
	CONSTRAINT paascount CHECK(LEN(_Password) >= 8),
	CONSTRAINT gender CHECK (sex = 'BOY' or sex = 'Girl'),
	PRIMARY KEY(Email)
);


CREATE TABLE Playlist(
   Playlist_id bigint not null,
   Cover VARBINARY(max)  , 
   TheDateOfTheLastUpdate date not null,
   PlaylistName varchar(30) not null,
   LikePlaylistNumber bigint DEFAULT 0,
   NumberOfAudios  bigint DEFAULT 0,
   creator varchar(40) not null,
   PRIMARY KEY(Playlist_id),
   constraint fk_UserPlaylist 
   foreign key (creator) references _User(Email)
   on DELETE CASCADE ON UPDATE CASCADE,
);
CREATE TABLE Album(
   Album_id bigint not null,
   Cover VARBINARY(MAX) ,  
   TheDateOfRelease date not null,
   Description text not null,
   AlbumName varchar(30) not null,
   Artist varchar(40) not null,
   PRIMARY KEY(Album_id),
   constraint fk_UserAlbum
   foreign key (Artist) references _User(Email)
   on DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Podcast(
   podcast_id			bigint			not null,
   Presenter		varchar(20)		not null,
   PodcastTopic		text			not null,
   EmailUser varchar(40) not null,
   PodcastLength time Default '00:00:00',
   TheDateOfRelease date not null,
   LikePodcastNumber bigint Default 0,
   Cover VARBINARY(MAX) , 
   PodcastName varchar(30) not null,
   StreamAmount bigint Default 0,
   SponserNames varchar(40) , 
   Producer varchar(40) , 
   PRIMARY KEY(podcast_id),
   foreign key (EmailUser) references _User(Email)
   on DELETE CASCADE ON UPDATE CASCADE,

);

CREATE TABLE PodcastGuest(
	podcast_id bigint not null , 
	GuestName		varchar(10),
	GuestDescriptionAndBiography	text ,
	   PRIMARY KEY(podcast_id),
   foreign KEY(podcast_id) references Podcast(podcast_id)
);


CREATE TABLE Music(
   Music_id			bigint					not null,
   Instrumental		int						not null,
   Genre			nvarchar(20)			not null,
   TrackNumber		int						DEFAULT 0,
   Language			nvarchar(30)			not null,
   ReleaseType		int						not null,
   Album_id			bigint		default 0,
   MusicLength time Default '00:00:00',
   TheDateOfRelease date not null,
   LikeMusicNumber bigint Default 0,
   Cover VARBINARY(MAX) , 
   MusicName varchar(30) not null,
   Lyric text,
   StreamAmount bigint Default 0,
   EmailUser varchar(40) not null,
   PRIMARY KEY(Music_id),
   constraint fk_AlbumMusic foreign key (Album_id)
   references Album(Album_id),
   constraint _INST check (Instrumental = 1 or Instrumental=2),
   constraint _RETY check (ReleaseType = 1 or ReleaseType=2),
   constraint gre check (Genre LIKE 'Rock' or Genre LIKE 'Jazz' or Genre LIKE 'Electronic Dance Music' or Genre LIKE 'Dubstep' 
   or Genre LIKE 'Techno' or Genre LIKE 'R&B' or Genre LIKE 'Country' or Genre LIKE 'Pop' ),
   constraint fk_UserMusic
   foreign key (EmailUser) references _User(Email)
   on DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE Comment(
   Comment_id	bigint	not null,
   LikeNumber	bigint default 0,
   CommentText	text	not null,
   CommentDate	date	not null,
   Audio_id bigint not null,
   EmailUser varchar(40),
   PRIMARY KEY(Comment_id),
   constraint fk_UserComment
   foreign key (EmailUser) references _User(Email)
   on DELETE NO ACTION on UPDATE NO ACTION,
);


CREATE TABLE Concert (
	Concert_id bigint not null , 
	Concert_Name varchar(30) not null , 
	venue_Name  varchar(30),
	Dateofconcert date not null , 
	timeofconcert time not null , 
	ArtistEmail varchar(40),
	PRIMARY KEY (Concert_id),
	foreign key (ArtistEmail) references _User(Email)
	);

CREATE TABLE Ticket (
	Ticket_id bigint not null , 
	NumberofChair bigint , 
	cost bigint , 
	Tickettype int not null , 
	PRIMARY KEY(Ticket_id),
	Concert_id bigint not null,
	foreign key (Concert_id) references Concert(Concert_id),
	UserEmail varchar(40) not null,
	foreign key (UserEmail) references _User(Email),
	constraint _Tickettype check (Tickettype = 1 or Tickettype=2),

	);


CREATE TABLE MusicVideo (
	MusicVideo_id bigint not null , 
	MuiscvideoName varchar(40) , 
	Lengthofvideo time Default '00:00:00',
	ReleaseDate date , 
	StreamAmount bigint Default 0,
	LikeMusicVideoNumber bigint Default 0,
	UserEmail varchar(40) not null,
	PRIMARY KEY (MusicVideo_id),
	foreign key (UserEmail) references _User(Email)
	);

CREATE TABLE Supervisor (
	supervisor_id bigint not null , 
	PRIMARY KEY (supervisor_id),
	Email varchar(40) not null ,
	FirstName varchar(40),
	LastName varchar(40),
	sex varchar(10) not null,
	--CONSTRAINT gender CHECK (sex = 'BOY' or sex = 'Girl'),
	SupervisionOrder text 
	);


CREATE TABLE Request(
	Request_id  bigint not null , 
	Subjectofrequest varchar(40) ,
	TextofRequest text , 
	SubmitDate date , 
	supervisor_answer text , 
	Checked  int not null , 
	constraint _check check (Checked = 1 or Checked=2),
	PRIMARY KEY(Request_id),
	UserEmail varchar(40) not null,
	Music_id bigint not null,
	supervisor_id bigint not null , 
	foreign key (UserEmail) references _User(Email),
	foreign key (Music_id) references Music(Music_id),
	foreign key (supervisor_id) references Supervisor(supervisor_id)
);

CREATE TABLE Follow(
   follower		varchar(40)		 not null,
   followin		varchar(40)		 not null,
   PRIMARY KEY(follower,followin),
   constraint fk_UserFollower
   foreign key (follower) references _User(Email)
   on DELETE CASCADE ON UPDATE CASCADE,
   constraint fk_UserFollowing
   foreign key (followin) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
);


CREATE TABLE LikePlaylist(
   EmailUser		varchar(40)		not null,
   Playlist_id		bigint			not null,
   PRIMARY KEY(EmailUser,Playlist_id),
   constraint fk_UserLikePlaylist_U
   foreign key (EmailUser) references _User(Email)
   on DELETE CASCADE ON UPDATE CASCADE,
   constraint fk_UserLikePlaylist_P
   foreign key (Playlist_id) references Playlist(Playlist_id)
   on DELETE NO ACTION ON UPDATE NO ACTION,
);


CREATE TABLE ListenPlaylist(
   EmailUser		varchar(40)		not null,
   Playlist_id		bigint			not null,
   constraint fk_UserListenPlaylist_U
   foreign key (EmailUser) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_UserListenPlaylist_P
   foreign key (Playlist_id) references Playlist(Playlist_id)
   on DELETE cascade ON UPDATE CASCADE,
);


CREATE TABLE ListenAlbum(
   EmailUser	varchar(40)		not null,
   Album_id		bigint			not null,
   constraint fk_UserListenAlbum_U
   foreign key (EmailUser) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_UserListenAlbum_A
   foreign key (Album_id) references Album(Album_id)
   on DELETE cascade ON UPDATE CASCADE,

);


CREATE TABLE LanguageAlbum(
   Album_id		bigint	 not null,
   LanguageName		varchar(20)	 not null,
   PRIMARY KEY(Album_id,LanguageName),
   constraint fk_AlbumLanguageAlbum 
   foreign key (Album_id) references Album(Album_id)
   on DELETE cascade ON UPDATE CASCADE,
);



CREATE TABLE SeeMusiclyrics(
   UserEmail	varchar(40)		not null,
   Music_id	 bigint		not null,
   constraint fk_UserSeeMusicText 
   foreign key (UserEmail) references _User(Email)
   on DELETE CASCADE ON UPDATE CASCADE,
   constraint fk_MusicSeeMusicText 
   foreign key (Music_id) references Music(Music_id)
   on DELETE NO ACTION ON UPDATE NO ACTION,
);


	USE [MusicPlatform2]

CREATE TABLE LikeMusic(
   UserEmail	varchar(40)		not null,
   Music_id		bigint		not null,
   PRIMARY KEY(Music_id,UserEmail),
   constraint fk_UserLikeMusic 
   foreign key (UserEmail) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_AudioLikeMusic 
   foreign key (Music_id) references Music(Music_id)
   on DELETE cascade ON UPDATE CASCADE,

);

CREATE TABLE ListenMusic(
   UserEmail	varchar(40)		not null,
   Music_id		bigint		not null,
   constraint fk_UserListenMusic 
   foreign key (UserEmail) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_AudioListenMusic 
   foreign key (Music_id) references Music(Music_id)
   on DELETE cascade ON UPDATE CASCADE,
);



CREATE TABLE LikePodcast(
   UserEmail	varchar(40)		not null,
   Podcast_id		bigint		not null,
   PRIMARY KEY(Podcast_id,UserEmail),
   constraint fk_UserLikePodcast 
   foreign key (UserEmail) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_AudioLikePodcast 
   foreign key (Podcast_id) references Podcast(Podcast_id)
   on DELETE cascade ON UPDATE CASCADE,

);

CREATE TABLE ListenPodcast(
   UserEmail	varchar(40)		not null,
   Podcast_id		bigint		not null,
   constraint fk_UserListenPodcast 
   foreign key (UserEmail) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_AudioListenPodcast 
   foreign key (Podcast_id) references Podcast(Podcast_id)
   on DELETE cascade ON UPDATE CASCADE,
);


CREATE TABLE LikeMusicVideo(
   UserEmail	varchar(40)		not null,
   MusicVideo_id		bigint		not null,
   PRIMARY KEY(MusicVideo_id,UserEmail),
   constraint fk_UserLikeMusicVideo 
   foreign key (UserEmail) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_AudioLikeMusicVideo 
   foreign key (MusicVideo_id) references MusicVideo(MusicVideo_id)
   on DELETE cascade ON UPDATE CASCADE,

);

CREATE TABLE ListenMusicVideo(
   UserEmail	varchar(40)		not null,
   MusicVideo_id		bigint		not null,
   constraint fk_UserListenMusicVideo 
   foreign key (UserEmail) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_AudioListenMusicVideo 
   foreign key (MusicVideo_id) references MusicVideo(MusicVideo_id)
   on DELETE cascade ON UPDATE CASCADE,
);

CREATE TABLE MusicsOFAlbum(
   Album_id		bigint	not null,
   Audio_id		bigint	not null,
   PRIMARY KEY(Album_id,Audio_id),
   constraint fk_MusicOFAlbum_Al
   foreign key (Album_id) references Album(Album_id)
   on DELETE cascade ON UPDATE CASCADE,
   constraint fk_MusicOFAlbum_Au
   foreign key (Audio_id) references Music(Music_id)
   on DELETE NO ACTION ON UPDATE NO ACTION,
);

CREATE TABLE CommentAlbum(
   Album_id		bigint	not null,
   Comment_id	bigint	not null,
   PRIMARY KEY(Album_id,Comment_id),
   constraint fk_AlbumComment_A
   foreign key (Album_id) references Album(Album_id)
   on DELETE cascade ON UPDATE CASCADE,
   constraint fk_CommentAlbum_C
   foreign key (Comment_id) references Comment(Comment_id)
   on DELETE NO ACTION ON UPDATE NO ACTION,
);

CREATE TABLE SingerAlbum(
   Album_id		bigint	not null,
   Artist	varchar(40)		not null,
   PRIMARY KEY(Album_id,Artist),
   constraint fk_SingerAlbum_A
   foreign key (Album_id) references Album(Album_id)
   on DELETE cascade ON UPDATE CASCADE,
   constraint fk_SingerAlbum_S 
   foreign key (Artist) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,

);

CREATE TABLE AudioCreatingPlaylist(
   Playlist_id		bigint	not null,
   DateCreating		date	not null,
   Audio_id	 bigint	 not null,
	PRIMARY KEY(Audio_id,Playlist_id),
   constraint fk_PlaylistCreating 
   foreign key (Playlist_id) references Playlist(Playlist_id)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_AudioCreating 
   foreign key (Audio_id) references Music(Music_id)
   on DELETE CASCADE ON UPDATE CASCADE,
);
CREATE TABLE Producer(
   Album_id bigint not null,
   producername varchar(30),
   PRIMARY KEY(Album_id,producername),
   constraint fk_AlbumProducer 
   foreign key (Album_id) references Album(Album_id)
   on DELETE cascade ON UPDATE CASCADE,
);

CREATE TABLE Singers(
   Audio_id		bigint not null,
   SingersName	varchar(40) not null,
   PRIMARY KEY(Audio_id,SingersName),
   constraint fk_AudioSinger 
   foreign key (Audio_id) references Music(Music_id)
   on DELETE cascade ON UPDATE CASCADE,
   constraint fk_UserSinger 
   foreign key (SingersName) references _User(Email)
   on DELETE No ACTION ON UPDATE NO ACTION,
);

--remove constraint
ALTER TABLE _USER
DROP CONSTRAINT gender 

--add constraint
ALTER TABLE _USER
ADD CONSTRAINT S_EX
CHECK (sex LIKE 'Male' or sex LIKE 'Female');

ALTER TABLE _USER
ADD CONSTRAINT BirthDate
CHECK (BirthDay>=1 AND BirthDay<=30 AND BirthMonth>=1 AND BirthMonth<=12 AND BirthYear <= 2000 );

ALTER TABLE _USER
ADD CONSTRAINT Sub_Type 
CHECK (SubscriptionType LIKE 'Free'  or SubscriptionType LIKE 'Premium');


ALTER TABLE _USER
ADD CONSTRAINT EmailCorrectForm 
CHECK (Email LIKE '%@%.%');

--update constraint
ALTER TABLE Music DROP CONSTRAINT _INST  
ALTER TABLE Music ADD CONSTRAINT INST
check (Instrumental = 1 or Instrumental=0); -- if instrumental => 1 else => 0

ALTER TABLE Music DROP CONSTRAINT _RETY 
ALTER TABLE Music ADD CONSTRAINT RETY 
check (ReleaseType = 1 or ReleaseType=0);	--if releasetype = album track => 1 releasetype = single => 0


-- USE [MusicPlatform2]
---Quer1: Albumwithmusics
Go
CREATE OR ALTER VIEW AlbumWithMusic AS
SELECT
    Album.Album_id,
    Album.Cover AS AlbumCover,
    Album.TheDateOfRelease AS AlbumReleaseDate,
    Album.Description AS AlbumDescription,
    Album.AlbumName AS AlbumName,
    Album.Artist AS AlbumArtist,
    Music.Music_id,
    Music.Instrumental,
    Music.Genre,
    Music.TrackNumber,
    Music.Language,
    Music.ReleaseType,
    Music.MusicLength,
    Music.TheDateOfRelease AS MusicReleaseDate,
    Music.LikeMusicNumber,
    Music.Cover AS MusicCover,
    Music.MusicName,
    Music.Lyric,
    Music.StreamAmount,
    Music.EmailUser AS MusicArtist
FROM
    Album
JOIN
    Music ON Album.Album_id = Music.Album_id;


go
--SELECT * FROM AlbumWithMusic;


---Quer2:SingersWithAlbums
Go 
SELECT
    Producer.Album_id,
    Producer.producername,
    Album.Cover AS AlbumCover,
    Album.TheDateOfRelease AS AlbumReleaseDate,
    Album.Description AS AlbumDescription,
    Album.AlbumName AS AlbumName,
    Album.Artist AS AlbumArtist,
    _User.Email AS SingerEmail,
    _User.FirstName AS SingerFirstName,
    _User.LastName AS SingerLastName,
    _User.NickName AS SingerNickName
FROM
    Producer
JOIN
    Album ON Producer.Album_id = Album.Album_id
JOIN
    _User ON Album.Artist = _User.Email;




---Query3 concert+ticket+user:

SELECT
    Concert.Concert_id,
    Concert.Concert_Name,
    Concert.venue_Name,
    Concert.Dateofconcert,
    Concert.timeofconcert,
    Concert.ArtistEmail,
    Ticket.Ticket_id,
    Ticket.NumberofChair,
    Ticket.cost,
    Ticket.Tickettype,
    Ticket.UserEmail,
    _User.FirstName AS UserName,
    _User.LastName AS UserLastName
FROM
    Concert
JOIN
    Ticket ON Concert.Concert_id = Ticket.Concert_id
JOIN
    _User ON Ticket.UserEmail = _User.Email;

---Query4:

SELECT
    Request.Request_id,
    Request.Subjectofrequest,
    Request.TextofRequest,
    Request.SubmitDate,
    Request.supervisor_answer,
    Request.Checked,
    _User.Email AS UserEmail,
    _User.FirstName AS UserFirstName,
    _User.LastName AS UserLastName,
    _User.sex AS UserSex,
    _User.NickName AS UserNickName,
    _User.SubscriptionType AS UserSubscriptionType,
    _User.FollowersNumber AS UserFollowersNumber,
    _User.StreamCollectionOfAllSounds AS UserStreamCollectionOfAllSounds,
    _User.BirthYear AS UserBirthYear,
    _User.BirthMonth AS UserBirthMonth,
    _User.BirthDay AS UserBirthDay,
    Music.Music_id,
    Music.Instrumental,
    Music.Genre,
    Music.TrackNumber,
    Music.Language,
    Music.ReleaseType,
    Music.MusicLength,
    Music.TheDateOfRelease AS MusicReleaseDate,
    Music.LikeMusicNumber,
    Music.Cover AS MusicCover,
    Music.MusicName,
    Music.Lyric,
    Music.StreamAmount,
    Music.EmailUser AS MusicArtist,
    Supervisor.supervisor_id,
    Supervisor.Email AS SupervisorEmail,
    Supervisor.FirstName AS SupervisorFirstName,
    Supervisor.LastName AS SupervisorLastName,
    Supervisor.sex AS SupervisorSex,
    Supervisor.SupervisionOrder
FROM
    Request
JOIN
    _User ON Request.UserEmail = _User.Email
JOIN
    Music ON Request.Music_id = Music.Music_id
JOIN
    Supervisor ON Request.supervisor_id = Supervisor.supervisor_id;



---Query5:
SELECT TOP 10
    MusicVideo.MusicVideo_id,
    MusicVideo.MuiscvideoName,
    MusicVideo.Lengthofvideo,
    MusicVideo.ReleaseDate,
    MusicVideo.StreamAmount,
    MusicVideo.LikeMusicVideoNumber,
    MusicVideo.UserEmail AS SingerEmail,
    _User.FirstName AS SingerFirstName,
    _User.LastName AS SingerLastName,
    _User.NickName AS SingerNickName
FROM
    MusicVideo
JOIN
    _User ON MusicVideo.UserEmail = _User.Email
ORDER BY
    MusicVideo.StreamAmount DESC;


---Query6:
SELECT
    Podcast.podcast_id,
    Podcast.Presenter,
    Podcast.PodcastTopic,
    Podcast.EmailUser AS PodcastHostEmail,
    Podcast.PodcastLength,
    Podcast.TheDateOfRelease AS PodcastReleaseDate,
    Podcast.LikePodcastNumber,
    Podcast.Cover AS PodcastCover,
    Podcast.PodcastName,
    Podcast.StreamAmount,
    Podcast.SponserNames,
    Podcast.Producer,
    PodcastGuest.GuestName,
    PodcastGuest.GuestDescriptionAndBiography
FROM
    Podcast
LEFT JOIN
    PodcastGuest ON Podcast.podcast_id = PodcastGuest.podcast_id;

GO
--QUERY6:
SELECT TOP(10)U.NickName,M.MusicName,M.EmailUser
FROM Music M
--JOIN ListenMusic LM1 ON M.Music_id = LM1.Music_id
JOIN LikeMusic LM2 ON M.Music_id = LM2.Music_id
LEFT JOIN _User U ON M.EmailUser = U.Email
GROUP BY M.Music_id,M.MusicName,M.EmailUser,U.NickName
ORDER BY COUNT(*);

--QUERY7
GO
SELECT 
	CONCAT( U.FirstName, ' ',
	U.LastName) as FullName,
	u.NickName,
	M.MusicName,
	M.Cover,
	C.CommentText,
	C.CommentDate,
	C.LikeNumber

FROM Comment C
LEFT JOIN 
			Music M ON C.Audio_id = M .Music_id
LEFT JOIN 
			_User U ON U.Email = C.EmailUser

--Query8
GO
SELECT 
	CONCAT( U1.FirstName, ' ',
	U1.LastName) as Writer,
	u.NickName AS W_NickName,
	CONCAT( U.FirstName, ' ',
	U.LastName) as Reciever,
	u.NickName AS R_NickName,
	A.AlbumName,
	A.TheDateOfRelease,
	M.MusicName,
	C.CommentText,
	C.CommentDate,
	C.LikeNumber

FROM Comment C
LEFT JOIN 
			_User U1 ON U1.Email = C.EmailUser
LEFT JOIN 
			Music M ON C.Audio_id = M.Music_id
LEFT JOIN 
			Album A ON M.Album_id = A.Album_id
LEFT JOIN 
			_User U ON U.Email = A.Artist

--Query9
GO
SELECT TOP(10) u.NickName , COUNT(*) AS GottenStreamInTheLast7Days
FROM ListenMusic LM
LEFT JOIN 
			Music M ON M.Music_id = LM.Music_id
LEFT JOIN
			_User U ON M.EmailUser = U.Email
WHERE
DATEDIFF(DAY,M.ReleaseType ,GETDATE()) <= 7
GROUP BY U.Email,U.NickName;

--Query10
GO
SELECT M.MusicName,
		M.Cover,
		M.Genre,
		M.Language,
		M.Lyric,
		M.ReleaseType,
		Q.NUMLIKE AS NUMBEROFLLIKE
FROM (
		SELECT LM.Music_id AS MUSICEID , COUNT(*) AS NUMLIKE
		FROM LIKEMUSIC LM
		GROUP BY LM.Music_id) AS Q
LEFT JOIN 
		Music M ON M.Music_id = Q.MUSICEID
WHERE Genre LIKE 'Pop'
Order BY Q.NUMLIKE;

--Query11
GO
SELECT	P.PlaylistName,
		M.MusicName,
		M.MusicLength,
		P.Cover,
		CONCAT(U.FirstName , ' ' , U.LastName) AS FullName,
		U.FollowersNumber,
		P.NumberOfAudios,
		P.TheDateOfTheLastUpdate,
		AP.DateCreating
FROM (
		SELECT LA.Playlist_id AS P_ID,COUNT(*) AS STREAMCOUNT
		FROM ListenPlaylist LA
		GROUP BY LA.Playlist_id) AS PA
LEFT JOIN 
			Playlist P ON P.Playlist_id = PA.P_ID
LEFT JOIN 
			_User U ON U.Email = P.creator
LEFT JOIN 
			AudioCreatingPlaylist AP ON AP.Playlist_id = PA.P_ID
LEFT JOIN 
			Music M ON M.Music_id = AP.Audio_id
WHERE DATEDIFF(MONTH, AP.DateCreating,GETDATE()) <= 2 
ORDER BY PA.STREAMCOUNT ;

--Query12
GO
SELECT 
		CONCAT(U1.FirstName , ' ' , U1.LastName) AS FullNameFollower,
		U1.NickName,
		U1.BirthYear,
		U1.BirthMonth,
		U1.BirthDay,
		U1.ProfilePhoto,
		CONCAT(U2.FirstName , ' ' , U2.LastName) AS FullNameFollowing,
		U2.NickName,
		U2.BirthYear,
		U2.BirthMonth,
		U2.BirthDay,
		U2.ProfilePhoto
FROM  Follow F
LEFT JOIN 
			_User U1 ON U1.Email = F.follower
LEFT JOIN 
			_User U2 ON U2.Email = F.followin
