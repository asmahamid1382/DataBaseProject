using System;
using Entities;
namespace ServiceContracts.DTO
{
    public class SongResponce
    {
        public Guid SongId { get; set; }
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
        public override bool Equals(object? obj)
        {
            if (obj== null || obj.GetType()!=typeof(SongResponce))
            {
                return false; 
            }
            SongResponce song_to_compare=(SongResponce)obj; 
            return (SongId==song_to_compare.SongId 
            && SongName==song_to_compare.SongName ); 
        }
        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

    }
    public static class SongExtention
    {
        public static SongResponce ToSongResponce(this Song song)
        {
            return new SongResponce()
            {
                SongId = song.SongId,
                SongName = song.SongName,
                ArtistName = song.ArtistName,
                Genre = song.Genre,
                Language = song.Language,
                ReleaseDate = song.ReleaseDate,
                ReleaseType = song.ReleaseType,
                LengthOfSong = song.LengthOfSong,
                CoverSong = song.CoverSong,
                Lyrics = song.Lyrics,
                NumberOfLikes = song.NumberOfLikes,
                NumberOfStreams = song.NumberOfStreams
            };
        }
    }
}
