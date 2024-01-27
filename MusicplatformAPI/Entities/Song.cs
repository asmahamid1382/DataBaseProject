namespace Entities;
public class Song
{
    // add forigean key from person to song 
   public Guid  SongId {get; set; }
    public string SongName { get; set; }

    public string ArtistName { get; set; }

    public string Genre { get; set; }

    public string Language { get; set; }

    public DateTime ReleaseDate { get; set; }

    public string ReleaseType { get; set; }

    public string LengthOfSong { get; set; }

    public string CoverSong { get; set; }

    public string Lyrics { get; set; }

    public int NumberOfStreams { get; set; }

    public int NumberOfLikes { get; set; }
}
