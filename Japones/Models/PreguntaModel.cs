public class PreguntaModel
{
    public int Capitulo { get; set; }
    public string Enunciado { get; set; } = string.Empty;
    public List<string> Opciones { get; set; } = new();
    public string RespuestaCorrecta { get; set; } = string.Empty;
}