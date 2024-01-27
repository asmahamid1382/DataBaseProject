using Entities;
using System; 
using System.Collections.Generic;
namespace ServiceContracts.DTO
{
    public class SongAddRequest
    {
        public string SongName { get; set; }

        public string ArtistName { get; set; }

        public string Genre { get; set; }

        public string Language { get; set; }

        public DateTime ReleaseDate { get; set; }

        public string ReleaseType { get; set; }

        public string LengthOfSong { get; set; }

        public string CoverSong { get; set; }

        public string Lyrics { get; set; }
        public Song ToSong()
        {
            return new Song()
            {
                SongName = SongName,
                ArtistName = ArtistName,
                Genre = Genre,
                Language = Language,
                ReleaseDate = ReleaseDate,
                ReleaseType = ReleaseType,
                LengthOfSong = LengthOfSong,
                CoverSong = CoverSong,
                Lyrics = Lyrics
            };
        }

    }
}