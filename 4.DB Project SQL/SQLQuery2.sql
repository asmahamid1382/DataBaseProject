USE [MusicPlatform]
---Quer1: Albumwithmusics
Go
CREATE VIEW AlbumWithMusic AS
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



SELECT * FROM AlbumWithMusic;


---Quer2:SingersWithAlbums
Go 
USE [MusicPlatform]
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
USE [MusicPlatform]
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

