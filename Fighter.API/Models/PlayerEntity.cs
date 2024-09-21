namespace Fighter.API.Models
{
    public record PlayerEntity : EntityBase
    {
        public string Name { get; set; } = string.Empty;
        public int Life { get; set; }
        public int Damage { get; set; }
        public int Shield { get; set; }
    }

}