namespace Ecomonitor.Domain
{
    public class ProductsDto
    {
        public required string Nome { get; set; }
        public string? Imagem { get; set; }
        public required string ConsumoMedio { get; set; }
        public required string UnidadeMedida { get; set; }
        public string? Observacoes { get; set; }
        public required int Categoria { get; set; }
    }
}