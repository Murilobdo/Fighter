namespace Fighter.API.Models
{
    public record ShieldEntity : EntityBase
    {
        public string Name { get; set; } = string.Empty;
        public int Value { get; set; }
        public int Cost { get; set; }
    }
}