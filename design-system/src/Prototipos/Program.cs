using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using Lar.Prototipos;
using Lar.Prototipos.Data;
using Radzen;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddScoped(sp => new HttpClient
{
    BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
});

// Servicos Radzen (dialog, notification, tooltip, context menu)
builder.Services.AddRadzenComponents();

// Servicos da aplicacao
builder.Services.AddScoped<FluxoService>();

await builder.Build().RunAsync();
