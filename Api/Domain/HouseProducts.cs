namespace Ecomonitor.Domain
{
    public class HouseProducts
    {
        public required int IdHouse { get; set; }
        public required int IdUser { get; set; }
        public required int IdProduct { get; set; }
        public required int TimeConsumer { get; set; }
    }
}