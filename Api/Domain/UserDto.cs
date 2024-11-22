namespace Ecomonitor.Domain
{
    public class UserDto
    {
        public required string Nome { get; set; }
        public required string Email { get; set; }
        public required string Senha { get; set; }
    }
}