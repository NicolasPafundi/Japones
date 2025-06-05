public class LeccionModel
{
    public int Id { get; set; }
    public string Titulo { get; set; } = "";
    public string Descripcion { get; set; } = "";
    public List<string>? Ejemplos { get; set; }
}