USE [MusicPlatform]

select Email
from dbo._User
where BirthYear < 2000;

select PlaylistName, Cover
from dbo.Playlist
where TheDateOfTheLastUpdate > '2022-01-01';

select AudioName, Audio_id, Cover
from dbo.Audio
where LikeAudioNumber > 100;

select Presenter, GuestDescriptionAndBiography
from dbo.Podcast
where PodcastTopic LIKE 'Topic3';

select Description, Audio_id
from dbo.Music
where Genre  = 'Jazz';

--Male Users
SELECT u.Email,u.NickName,u.sex
FROM dbo._User u
where u.sex LIKE 'Male';

--Free or under 18 
SELECT u.Email,u.NickName,u.SubscriptionType,u.BirthYear
FROM dbo._User u
where u.SubscriptionType LIKE 'Free'
UNION
SELECT u.Email,u.NickName,u.SubscriptionType,u.BirthYear
FROM dbo._User u
WHERE YEAR(GETDATE()) - U.BirthYear < 18;

--Query11
SELECT *
FROM dbo._User;

--Query14
SELECT a.EmailUser as UserName , Max(a.StreamAmount )as MostStream
FROM dbo.Audio a
GROUP BY a.EmailUser;

--Query15
SELECT a.EmailUser as UserName , Max(a.TheDateOfRelease)as DateOfLatestRealse_Audio
FROM dbo.Audio a
GROUP BY a.EmailUser;

--Query16
SELECT a.Artist as Artist_Name , Max(a.TheDateOfRelease)as DateOfLatestRealse_Album
FROM dbo.Album a
GROUP BY a.Artist;

---Query 19 
--version1-with procedure
Select Top(10) AudioName ,LikeAudioNumber  
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id
ORDER BY (LikeAudioNumber)DESC;

 --version2-with function
Select Top(10) AudioName ,dbo.GetAudioLike(a.Audio_id) as LikeAudioNumber  
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id
ORDER BY (LikeAudioNumber)DESC;

---Query 20
--version1-with procedure
Select Top(10) AudioName ,StreamAmount
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id
ORDER BY (StreamAmount)DESC;

 --version2-with function
Select Top(10) AudioName ,dbo.GetAudioStream(a.Audio_id) as StreamAmount
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id
ORDER BY (StreamAmount)DESC;

---Query 21
Select Top(10) AudioName 
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id AND Genre LIKE 'Rock'
ORDER BY (LikeAudioNumber)DESC;

Select Top(10) AudioName 
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id AND Genre LIKE 'Jazz'
ORDER BY (LikeAudioNumber)DESC;

Select Top(10) AudioName
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id AND Genre LIKE 'Electronic Dance Music'
ORDER BY (LikeAudioNumber)DESC;

Select Top(10) AudioName
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id AND  Genre LIKE 'Dubstep' 
ORDER BY (LikeAudioNumber)DESC;

Select Top(10) AudioName 
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id AND  Genre LIKE 'Techno'
ORDER BY (LikeAudioNumber)DESC;

Select Top(10) AudioName
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id AND  Genre LIKE 'R&B'
ORDER BY (LikeAudioNumber)DESC;

Select Top(10) AudioName
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id AND  Genre LIKE 'Country'
ORDER BY (LikeAudioNumber)DESC;

Select Top(10) AudioName
FROM dbo.Audio a,dbo.Music m
WHERE a.Audio_id = m.Audio_id AND  Genre LIKE 'Pop'
ORDER BY (LikeAudioNumber)DESC;



---Query 22
--version1-with procedure
Select Top(10) NickName , ProfilePhoto ,FollowersNumber
FROM dbo._User
ORDER BY (FollowersNumber)DESC;

 --version2-with function
 Select Top(10) NickName , ProfilePhoto , dbo.GetFllowers(Email)as FollowersNumber
FROM dbo._User
ORDER BY (FollowersNumber)DESC;

---Query 23
--version2-with function
 Select Top(10) NickName , ProfilePhoto ,dbo.GetStreamCollectionOfAllSounds(Email) as StreamCollectionOfAllSounds
FROM dbo._User 
ORDER BY (StreamCollectionOfAllSounds) DESC;

--2 ورژن کوئری های بعدی مانند اهنگ هست
---Query 25
Select Top(10) AudioName ,LikeAudioNumber 
FROM dbo.Audio a,dbo.Podcast p
WHERE a.Audio_id = p.Audio_id
ORDER BY (LikeAudioNumber)DESC;

---Query 26
Select Top(10) AudioName ,StreamAmount
FROM dbo.Audio a,dbo.Podcast p
WHERE a.Audio_id = p.Audio_id
ORDER BY (StreamAmount) DESC;

-- Delete from table
delete 
from dbo.AudioCreatingPlaylist
where Playlist_id = 1 and Audio_id = 3;

delete 
from dbo.CommentAlbum
where Album_id = 1 and Comment_id = 2;

delete
from _User
where Email = 'email@gmail.com';

delete 
from dbo.MusicsOFAlbum
where Album_id = 1 and Audio_id = 5;

delete
from Audio
where Audio_id = 8;

-- Update rows
update Podcast
set Audio_id = 7
where PodcastTopic LIKE 'Topic3'

update Audio
set LikeAudioNumber = LikeAudioNumber+100
where TheDateOfRelease > '2023-01-01'

update Album
set AlbumName = 'Album2'
where Artist = 'email0@gmail.com'

update Album
set Cover =CONVERT (VARBINARY(MAX),'0xFFD8FF')
where Album_id = 2
/*
-- Update table
alter table Album
add LikeAlbumNumber bigint default 0; 

alter table Podcast
add PodcastName varchar(30);

alter table Audio
add YearOfRelease bigint default 0;*/
