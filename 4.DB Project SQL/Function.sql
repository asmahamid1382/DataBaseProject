USE [MusicPlatform]
GO
CREATE OR ALTER FUNCTION GetFllowers(@user varchar(40))
RETURNS INTEGER
AS
BEGIN
   DECLARE @followers INTEGER

   set @followers = (select Count(*)
					From dbo.Follow
					where followin = @user)


   RETURN @followers
END;

go
CREATE OR ALTER FUNCTION GetAudioLike(@audio_id bigint)
RETURNS INTEGER
AS
BEGIN
   DECLARE @likes INTEGER

   set @likes= (select Count(*)
					From dbo.LikeAudio
					where Audio_id = @audio_id)
   RETURN @likes
END;


go
CREATE OR ALTER FUNCTION GetAudioStream(@id bigint) 
RETURNS INTEGER
AS
BEGIN
   DECLARE @stream INTEGER

   set @stream = (select Count(*)
					From dbo.ListenAudio
					where Audio_id = @id)
   RETURN @stream
END;

go
CREATE OR ALTER FUNCTION GetAlbumStream(@id bigint) 
RETURNS INTEGER
AS
BEGIN
   DECLARE @stream INTEGER

   set @stream = (select Count(*)
					From dbo.ListenAlbum
					where Album_id = @id)
   RETURN @stream
END;

go
CREATE OR ALTER FUNCTION GetPlaylistStream(@id bigint) 
RETURNS INTEGER
AS
BEGIN
   DECLARE @stream INTEGER

   set @stream = (select Count(*)
					From dbo.ListenPlaylist
					where Playlist_id = @id)
   RETURN @stream
END

go
CREATE OR ALTER FUNCTION GetPlaylistLike(@id bigint) 
RETURNS INTEGER
AS
BEGIN
   DECLARE @stream INTEGER

   set @stream = (select Count(*)
					From dbo.LikePlaylist
					where Playlist_id = @id)
   RETURN @stream
END;

go
CREATE OR ALTER FUNCTION GetStreamCollectionOfAllSounds(@email varchar(40)) 
RETURNS INTEGER
AS
BEGIN
   DECLARE @stream INTEGER
   select @stream = SUM(a.StreamAmount)
					From dbo.Audio a
					where a.EmailUser = @email
   RETURN @stream
END;