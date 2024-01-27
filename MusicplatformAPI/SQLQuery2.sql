USE [MusicPlatform2]
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
