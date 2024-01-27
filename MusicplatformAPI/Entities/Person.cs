namespace Entities
{
    public class Person
    {
        public Guid PersonId{get;set;}
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Nickname { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Gender { get; set; }
        public string ProfilePicture { get; set; }
        public int NumberOfFollowers { get; set; }
        public int TotalStreams { get; set; }
        public List<Entities.Song> Songs { get; set; }
    }
}