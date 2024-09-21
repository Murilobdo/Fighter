namespace Fighter.API.Models
{
    public record BattleEntity : EntityBase
    {
        public int IdPlayer1 { get; set; }
        public PlayerEntity Player1 { get; set; } = new();
        public int IdPlayer2 { get; set; }
        public PlayerEntity Player2 { get; set; } = new();
        public DateTime CreatAt { get; set; } = DateTime.Now;
        public List<BattleLogEntity> Logs { get; set; } = new();
    }
}