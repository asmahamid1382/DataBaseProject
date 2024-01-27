using ServiceContracts;
using ServiceContracts.DTO;
using Entities;
using System; 
using System.Linq; 
namespace Services
{
    public class SongServices : ISongService
    {
        private readonly List<Song> _Songs;

        public SongServices()
        {
            _Songs = new List<Song>();
        }
        public SongResponce AddSong(SongAddRequest songAddRequest)
        {
            if (songAddRequest == null)
            {
                throw new ArgumentNullException(nameof(songAddRequest));
            }
            if (songAddRequest.SongName == null)
            {
                throw new ArgumentNullException(nameof(songAddRequest.SongName));

            }
            if (_Songs.Where(s=>s.SongName==songAddRequest.SongName).Count()>0)
            {
                throw new ArgumentException("Song Already Exists "); 
            }
            Song song = songAddRequest.ToSong();
            song.SongId = Guid.NewGuid();
            _Songs.Add(song);
            return song.ToSongResponce();
        }

        public List<SongResponce> GetAllSongs()
        {
            return _Songs.Select(x => x.ToSongResponce()).ToList();
        }

        public List<SongResponce> GetSongByName(string SongName)
        {
            if (SongName==null)
            {
                return null; 
            }
            List<SongResponce> result =_Songs.Where(x=>x.SongName==SongName).Select(x=>x.ToSongResponce()).ToList();

            if (result.Count==0)
            {
                return null; 
            }
            return result; 
        }
    }
}