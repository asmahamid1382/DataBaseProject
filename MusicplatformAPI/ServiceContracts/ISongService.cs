using ServiceContracts.DTO;

namespace ServiceContracts
{
    public interface ISongService
    {
        SongResponce AddSong(SongAddRequest songAddRequest);
        List<SongResponce> GetAllSongs();
        List<SongResponce> GetSongByName(string SongName);
    }

}