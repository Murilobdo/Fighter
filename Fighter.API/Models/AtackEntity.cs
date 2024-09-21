namespace Fighter.API.Models
{
    public record AtackEntity : EntityBase
    {
        public string Name { get; set; } = string.Empty;
        public Type Type { get; set; }
        public int Damage { get; set; }
        public int Cost { get; set; }
    }
}