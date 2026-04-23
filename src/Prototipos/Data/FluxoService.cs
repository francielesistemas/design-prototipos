using System.Net.Http.Json;

namespace Lar.Prototipos.Data;

/// <summary>
/// Carrega a lista de fluxos do mock JSON.
/// Em producao (quando os devs ligarem com backend real),
/// esta classe troca a chamada por GET /api/fluxos.
/// </summary>
public class FluxoService
{
    private readonly HttpClient _http;
    private List<Fluxo>? _cache;

    public FluxoService(HttpClient http)
    {
        _http = http;
    }

    public async Task<List<Fluxo>> ObterTodosAsync()
    {
        if (_cache is not null) return _cache;

        var response = await _http.GetFromJsonAsync<FluxosResponse>("mocks/fluxos.json")
            ?? new FluxosResponse();

        _cache = response.Fluxos;
        return _cache;
    }

    public async Task<Fluxo?> ObterPorIdAsync(string id)
    {
        var todos = await ObterTodosAsync();
        return todos.FirstOrDefault(f => f.Id == id);
    }
}
