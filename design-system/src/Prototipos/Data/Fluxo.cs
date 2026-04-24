using System.Text.Json.Serialization;

namespace Lar.Prototipos.Data;

/// <summary>
/// Representa um fluxo de prototipacao (conjunto de telas navegaveis).
/// Deserializa de wwwroot/mocks/fluxos.json.
/// </summary>
public class Fluxo
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = string.Empty;

    [JsonPropertyName("nome")]
    public string Nome { get; set; } = string.Empty;

    [JsonPropertyName("descricao")]
    public string Descricao { get; set; } = string.Empty;

    [JsonPropertyName("personas")]
    public List<string> Personas { get; set; } = new();

    [JsonPropertyName("status")]
    public string Status { get; set; } = "rascunho";

    [JsonPropertyName("ultimaAtualizacao")]
    public DateOnly UltimaAtualizacao { get; set; }

    [JsonPropertyName("quantidadeTelas")]
    public int QuantidadeTelas { get; set; }

    [JsonPropertyName("primeiroPasso")]
    public string PrimeiroPasso { get; set; } = "/";

    /// <summary>
    /// Label legivel e chave de estilo para o status.
    /// </summary>
    public (string Label, string CssClass) StatusInfo => Status switch
    {
        "aprovado"   => ("Aprovado",   "rz-badge--status-aprovado"),
        "em-revisao" => ("Em revisão", "rz-badge--status-revisao"),
        _            => ("Rascunho",   "rz-badge--status-rascunho"),
    };

    public string UltimaAtualizacaoFormatada =>
        UltimaAtualizacao.ToString("dd/MM/yyyy");
}

public class FluxosResponse
{
    [JsonPropertyName("fluxos")]
    public List<Fluxo> Fluxos { get; set; } = new();
}
