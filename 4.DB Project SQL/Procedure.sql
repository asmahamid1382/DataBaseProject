USE [MusicPlatform]
GO
CREATE OR ALTER PROCEDURE dbo.UpdateAudioLikesCount( @Audio_id  BIGINT)
AS
BEGIN
	DECLARE @LikeCount BIGINT

	SELECT @LikeCount =	 COUNT(*) 
	FROM MusicPlatform.dbo.LikeAudio m
	WHERE m.Audio_id = @Audio_id

	UPDATE MusicPlatform.dbo.Audio 
	SET LikeAudioNumber = @LikeCount
	WHERE Audio_id = @Audio_id

END;

DECLARE @id bigint

DECLARE cur CURSOR FOR SELECT Audio_id FROM MusicPlatform.dbo.Audio
OPEN cur

FETCH NEXT FROM cur INTO @id

WHILE @@FETCH_STATUS = 0 BEGIN
    EXEC dbo.UpdateAudioLikesCount @id
    FETCH NEXT FROM cur INTO @id
END

CLOSE cur    
DEALLOCATE cur

go
CREATE OR ALTER PROCEDURE dbo.UpdateAudioStream( @Audio_id  BIGINT)
AS
BEGIN
	DECLARE @stream BIGINT

	SELECT @stream = COUNT(*) 
	FROM MusicPlatform.dbo.ListenAudio
	WHERE Audio_id = @Audio_id

	UPDATE MusicPlatform.dbo.Audio 
	SET StreamAmount = @stream
	WHERE Audio_id = @Audio_id

END;


DECLARE @id bigint

DECLARE cur CURSOR FOR SELECT Audio_id FROM MusicPlatform.dbo.Audio
OPEN cur

FETCH NEXT FROM cur INTO @id

WHILE @@FETCH_STATUS = 0 BEGIN
    EXEC dbo.UpdateAudioStream @id
    FETCH NEXT FROM cur INTO @id
END

CLOSE cur    
DEALLOCATE cur

go
CREATE OR ALTER PROCEDURE dbo.UpdatePlaylistLikesCount( @playlist_id  BIGINT)
AS
BEGIN
	DECLARE @PlaylistCount BIGINT

	SELECT @PlaylistCount =	 COUNT(*) 
	FROM MusicPlatform.dbo.LikePlaylist p
	WHERE p.Playlist_id = @playlist_id

	UPDATE MusicPlatform.dbo.Playlist 
	SET LikePlaylistNumber = @PlaylistCount
	WHERE Playlist_id = @playlist_id

END;

DECLARE @id bigint

DECLARE cur CURSOR FOR SELECT Playlist_id FROM MusicPlatform.dbo.Playlist
OPEN cur

FETCH NEXT FROM cur INTO @id

WHILE @@FETCH_STATUS = 0 BEGIN
    EXEC dbo.UpdatePlaylistLikesCount @id
    FETCH NEXT FROM cur INTO @id
END

CLOSE cur    
DEALLOCATE cur

go
CREATE OR ALTER PROCEDURE dbo.UpdateFllowersCount( @user_id  varchar(40))
AS
BEGIN
	DECLARE @FollowerCount BIGINT

	SELECT @FollowerCount =	 COUNT(*) 
	FROM MusicPlatform.dbo.Follow
	WHERE followin = @user_id

	UPDATE MusicPlatform.dbo._User
	SET FollowersNumber = @FollowerCount
	WHERE Email = @user_id

END;

DECLARE @email varchar(40)

DECLARE cur CURSOR FOR SELECT Email FROM MusicPlatform.dbo._User
OPEN cur

FETCH NEXT FROM cur INTO @email

WHILE @@FETCH_STATUS = 0 BEGIN
    EXEC dbo.UpdateFllowersCount @email 
    FETCH NEXT FROM cur INTO @Email 
END

CLOSE cur    
DEALLOCATE cur

