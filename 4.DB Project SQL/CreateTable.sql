--CREATE DATABASE MusicPlatform

USE [MusicPlatform]
Create TABLE _User(
	Email varchar(40) default'Deleted Acoount' ,
	ProfilePhoto varbinary(max) ,
	_Password varchar(15) not null,
	sex varchar(10) not null,
	NickName varchar(20),
	SubscriptionType varchar(30) not null,
	FollowersNumber bigint DEFAULT 0,
	StreamCollectionOfAllSounds bigint DEFAULT 0,
	BirthYear bigint,
	BirthMonth int,
	BirthDay int,
	CONSTRAINT paascount CHECK(LEN(_Password) >= 6),
	CONSTRAINT gender CHECK (sex = 'BOY' or sex = 'Girl'),
	PRIMARY KEY(Email)
);

CREATE TABLE Playlist(
   Playlist_id bigint not null,
   Cover VARBINARY(max)  , 
   TheDateOfTheLastUpdate date not null,
   PlaylistName varchar(30) not null,
   LikePlaylistNumber bigint DEFAULT 0,
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

CREATE TABLE Audio(
   Audio_id bigint not null,
   AudioLength time Default '00:00:00',
   TheDateOfRelease date not null,
   LikeAudioNumber bigint Default 0,
   Cover VARBINARY(MAX) , 
   AudioName varchar(30) not null,
   Lyric text,
   StreamAmount bigint Default 0,
   EmailUser varchar(40) not null,
   PRIMARY KEY(Audio_id),
   constraint fk_UserAudio
   foreign key (EmailUser) references _User(Email)
   on DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Podcast(
   Audio_id			bigint			not null,
   GuestName		varchar(10),
   Presenter		varchar(20)		not null,
   PodcastTopic		text			not null,
   GuestDescriptionAndBiography		text ,
   PRIMARY KEY(Audio_id),
   foreign KEY(Audio_id) references Audio(Audio_id)
   on DELETE CASCADE ON UPDATE CASCADE,

);

CREATE TABLE Music(
   Audio_id			bigint					not null,
   Instrumental		int						not null,
   Genre			nvarchar(20)			not null,
   TrackNumber		int						DEFAULT 0,
   Language			nvarchar(30)			not null,
   Description		text					not null,
   ReleaseType		int						not null,
   Album_id			bigint		default 0,
   PRIMARY KEY(Audio_id),
   foreign KEY(Audio_id) references Audio(Audio_id)
   on DELETE CASCADE ON UPDATE CASCADE,
   constraint fk_AlbumMusic foreign key (Album_id)
   references Album(Album_id),
   constraint _INST check (Instrumental = 1 or Instrumental=2),
   constraint _RETY check (ReleaseType = 1 or ReleaseType=2),
   constraint gre check (Genre LIKE 'Rock' or Genre LIKE 'Jazz' or Genre LIKE 'Electronic Dance Music' or Genre LIKE 'Dubstep' 
   or Genre LIKE 'Techno' or Genre LIKE 'R&B' or Genre LIKE 'Country' or Genre LIKE 'Pop' ),

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
   constraint fk_AudioComment
   foreign key (Audio_id) references Audio(Audio_id)
   on DELETE CASCADE ON UPDATE CASCADE,

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

CREATE TABLE MusicsOFAlbum(
   Album_id		bigint	not null,
   Audio_id		bigint	not null,
   PRIMARY KEY(Album_id,Audio_id),
   constraint fk_MusicOFAlbum_Al
   foreign key (Album_id) references Album(Album_id)
   on DELETE cascade ON UPDATE CASCADE,
   constraint fk_MusicOFAlbum_Au
   foreign key (Audio_id) references Audio(Audio_id)
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

CREATE TABLE LanguageAlbum(
   Album_id		bigint	 not null,
   LanguageName		varchar(20)	 not null,
   PRIMARY KEY(Album_id,LanguageName),
   constraint fk_AlbumLanguageAlbum 
   foreign key (Album_id) references Album(Album_id)
   on DELETE cascade ON UPDATE CASCADE,
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
   foreign key (Audio_id) references Audio(Audio_id)
   on DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE SeeMusiclyrics(
   UserEmail	varchar(40)		not null,
   Audio_id	 bigint		not null,
   constraint fk_UserSeeMusicText 
   foreign key (UserEmail) references _User(Email)
   on DELETE CASCADE ON UPDATE CASCADE,
   constraint fk_AudioSeeMusicText 
   foreign key (Audio_id) references Audio(Audio_id)
   on DELETE NO ACTION ON UPDATE NO ACTION,
);

CREATE TABLE LikeMusic(
   UserEmail	varchar(40)		not null,
   Audio_id		bigint		not null,
   PRIMARY KEY(Audio_id,UserEmail),
   constraint fk_UserLikeMusic 
   foreign key (UserEmail) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_AudioLikeMusic 
   foreign key (Audio_id) references Audio(Audio_id)
   on DELETE cascade ON UPDATE CASCADE,

);

CREATE TABLE ListenMusic(
   UserEmail	varchar(40)		not null,
   Audio_id		bigint		not null,
   constraint fk_UserListenMusic 
   foreign key (UserEmail) references _User(Email)
   on DELETE NO ACTION ON UPDATE NO ACTION,
   constraint fk_AudioListenMusic 
   foreign key (Audio_id) references Audio(Audio_id)
   on DELETE cascade ON UPDATE CASCADE,
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
   foreign key (Audio_id) references Audio(Audio_id)
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
CHECK (BirthDay>=1 AND BirthDay<=30 AND BirthMonth>=1 AND BirthMonth<=12 AND BirthYear > 2000 );

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

