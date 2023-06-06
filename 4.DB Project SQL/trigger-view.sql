---view 
USE [MusicPlatform]
Go 
CREATE OR ALTER VIEW AlbumsWithTracks AS
SELECT a.Album_id, a.AlbumName, a.Artist, a.TheDateOfRelease,
       m.Audio_id,aa.AudioName, m.Instrumental, m.TrackNumber, m.Genre,aa.AudioLength
FROM dbo.Album a
INNER JOIN Music m ON a.Album_id = m.Album_id
INNER JOIN dbo.Audio aa ON aa.Audio_id = m.Audio_id;
Go 
SELECT * FROM AlbumsWithTracks;
Go 
CREATE OR ALTER VIEW SingersWithSongs AS
SELECT s.Audio_id, s.SingersName, a.AudioName, a.TheDateOfRelease, a.LikeAudioNumber, m.Genre, m.Language, m.Description
FROM Singers s
INNER JOIN Audio a ON s.Audio_id = a.Audio_id
INNER JOIN Music m ON s.Audio_id = m.Audio_id;
Go 
SELECT * FROM SingersWithSongs;

Go 
CREATE OR ALTER VIEW MostStreamedAudioBySinger AS
SELECT SingersName, AudioName, MAX(StreamAmount) AS MaxStreams
FROM Audio a
JOIN Singers s ON a.Audio_id = s.Audio_id
GROUP BY SingersName, AudioName;
Go 
CREATE OR ALTER VIEW LatestReleasedAudioBySinger AS
SELECT SingersName, AudioName, TheDateOfRelease AS ReleaseDate
FROM Audio a
JOIN Singers s ON a.Audio_id = s.Audio_id
WHERE TheDateOfRelease = (SELECT MAX(TheDateOfRelease) FROM Audio WHERE EmailUser = a.EmailUser)
GROUP BY SingersName, AudioName, TheDateOfRelease;




---trigger 
Go 
CREATE OR ALTER TRIGGER generate_Audio_id
ON Audio
INSTEAD of INSERT 
AS 
BEGIN
    SET NOCOUNT ON;
    DECLARE @NewAudioId BIGINT;
    SET @NewAudioId = CAST(CAST(NEWID() AS VARBINARY(8)) AS BIGINT);
    UPDATE Audio SET Audio_id = @NewAudioId WHERE Audio_id IS NULL;
END;


Go
CREATE OR ALTER TRIGGER generate_Album_id
ON Album
INSTEAD of INSERT
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @NewAlbum_id BIGINT;
  SELECT @NewAlbum_id = CAST(CAST(NEWID() AS VARBINARY(8)) AS BIGINT);
  UPDATE Album SET Album_id = @NewAlbum_id WHERE Album_id IS NULL;
END;


Go
CREATE OR ALTER TRIGGER generate_Playlist_id
ON Playlist
INSTEAD OF INSERT 
AS 
BEGIN
  SET NOCOUNT ON;
  DECLARE @NewPlaylist_id BIGINT;
  SET @NewPlaylist_id = CAST(CAST(NEWID() AS VARBINARY(8)) AS BIGINT);
  UPDATE Playlist SET Playlist_id = @NewPlaylist_id WHERE Playlist_id IS NULL;

END;




-- Go
-- CREATE OR ALTER TRIGGER remove_AUdio_references
-- ON Audio
-- AFTER DELETE 
-- AS
-- BEGIN
--     DELETE FROM Playlist
--     WHERE  @Audio_id = @Audio_id;
-- END

-- GO

-- CREATE OR ALTER TRIGGER deleteAudioRecord
-- ON Audio
-- AFTER DELETE
-- AS
-- BEGIN
--     DECLARE @Audio_id bigint;
--     SELECT @Audio_id = deleted.Audio_id
--     FROM deleted;
--     DELETE FROM Playlist
--     WHERE  Audio_id = @Audio_id;
--     DELETE FROM Album
--     WHERE  Audio_id = @Audio_id;

-- END

-- GO

-- CREATE OR ALTER TRIGGER deleteplaylistRecord
-- ON Playlist
-- AFTER DELETE
-- AS
-- BEGIN
--     DECLARE @Playlist_id bigint;
--     SELECT @Playlist_id = deleted.Playlist_id

-- END

-- GO

-- CREATE OR ALTER TRIGGER deletealbumRecord
-- ON Album
-- AFTER DELETE
-- AS
-- BEGIN
--     DECLARE @Album_id bigint;
--     SELECT @Album_id = deleted.Album_id

-- END
Go
CREATE or ALTER TRIGGER DeleteMusic
ON Music
FOR DELETE
AS
BEGIN
  DELETE FROM Comment WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
  DELETE FROM LikeAudio WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
  DELETE FROM ListenAudio WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
  DELETE FROM AudioCreatingPlaylist WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
  DELETE FROM Singers WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
END;
 Go
CREATE or ALTER TRIGGER DeletePlaylist
ON Playlist
FOR DELETE
AS
BEGIN
  DELETE FROM LikePlaylist WHERE Playlist_id IN (SELECT Playlist_id
  FROM deleted);
  DELETE FROM ListenPlaylist WHERE Playlist_id IN (SELECT Playlist_id
  FROM deleted);
  DELETE FROM AudioCreatingPlaylist WHERE Playlist_id IN (SELECT Playlist_id
  FROM deleted);
END;

Go
CREATE or ALTER TRIGGER DeleteAudio
ON Audio
FOR DELETE
AS
BEGIN
  DELETE FROM Comment WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
  DELETE FROM LikeAudio WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
  DELETE FROM ListenAudio WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
  DELETE FROM AudioCreatingPlaylist WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
  DELETE FROM Singers WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
END;

 Go
CREATE or ALTER TRIGGER DeletePodcast
ON Podcast
FOR DELETE
AS
BEGIN
  DELETE FROM Comment WHERE Audio_id IN (SELECT Audio_id
  FROM deleted);
END;
 Go
CREATE or ALTER TRIGGER DeleteAlbum
ON Album
FOR DELETE
AS
BEGIN
  DELETE FROM MusicsOFAlbum WHERE Album_id IN (SELECT Album_id
  FROM deleted);
  DELETE FROM CommentAlbum WHERE Album_id IN (SELECT Album_id
  FROM deleted);
  DELETE FROM SingerAlbum WHERE Album_id IN (SELECT Album_id
  FROM deleted);
  DELETE FROM LanguageAlbum WHERE Album_id IN (SELECT Album_id
  FROM deleted);
  DELETE FROM Producer WHERE Album_id IN (SELECT Album_id
  FROM deleted);
END;
