# Protótipos de Design — Cooperativa Lar

Repositório de protótipos navegáveis em código real (Blazor WebAssembly + Radzen Blazor Material Theme).

**Link público:** https://franciele.sistemas.github.io/design-prototipos/
*(ativo após o primeiro deploy — veja a seção "Publicação" abaixo.)*

---

## Para que serve

Este repositório substitui protótipos estáticos do Figma por **telas navegáveis reais**, construídas com os mesmos componentes que os devs usam em produção. Três funções:

1. **Prototipagem** — onde o time de design itera e guarda versões.
2. **Validação** — link público que pode ser enviado pra stakeholders pelo Teams/e-mail.
3. **Entrega pros devs** — o código fica pronto pra o time de engenharia clonar ou copiar.

---

## Stack

- **Blazor WebAssembly** (.NET 8), standalone — roda 100% no navegador, hospedável em sites estáticos como o GitHub Pages.
- **Radzen.Blazor** (pacote público `Radzen.Blazor`) — biblioteca de componentes.
- **Design System — Lar** — tokens CSS em `src/Prototipos/wwwroot/css/ds-tokens.css`, extraídos de `docs/design-system-blazor.md`.

---

## Como rodar localmente

Pré-requisito: .NET 8 SDK ([baixar aqui](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)).

```bash
dotnet run --project src/Prototipos
```

O app abre em `https://localhost:5001`.

---

## Estrutura

```
design-prototipos/
├── src/Prototipos/           ← Projeto Blazor
│   ├── Pages/
│   │   ├── Index.razor       ← Home (catálogo de fluxos)
│   │   └── fluxos/           ← Cada fluxo é uma subpasta
│   ├── Shared/               ← Layout e nav
│   ├── wwwroot/
│   │   ├── css/ds-tokens.css ← Fonte única dos tokens do DS
│   │   └── mocks/            ← Dados fake (JSON)
│   └── Data/                 ← Modelos e services
├── docs/
│   ├── FLUXOS.md             ← Status de cada fluxo
│   └── design-system-blazor.md ← Especificação do DS (fonte)
├── entregas/                 ← Zips prontos pros devs (opcional)
└── .github/workflows/        ← Deploy automático no GitHub Pages
```

---

## Publicação (GitHub Pages)

O deploy é automático a cada `push` na branch `main`, via GitHub Actions (`.github/workflows/deploy.yml`).

**Primeira configuração** (uma vez só):
1. No GitHub, entre no repositório → **Settings** → **Pages**.
2. Em **Source**, escolha **GitHub Actions**.
3. Salve. A partir daí, qualquer push em `main` dispara o build e publica em minutos.

O link final é `https://<seu-usuario>.github.io/design-prototipos/`.

---

## Convenções

- **Nomes de arquivos em português** (`cadastro-usuario.razor`, não `user-registration.razor`).
- **Sem hardcode de cores** — sempre use tokens (`var(--rz-primary)`, `var(--rz-base-900)`, etc).
- **Dados mock em JSON** em `wwwroot/mocks/`. Nunca fingir backend real.
- **Commits em português**, com prefixo convencional: `feat:`, `fix:`, `docs:`, `wip:`.

---

## Para os devs

Quando um fluxo for entregue pra dev, o ponto de entrada é:
- **Pasta do código:** `src/Prototipos/Pages/fluxos/<nome-do-fluxo>/`
- **README do fluxo:** dentro da pasta, explica decisões de design, personas e pontos de atenção.
- **Protótipo navegável:** link público acima + o path do fluxo.
- **Zip opcional:** em `entregas/entrega-<fluxo>-<data>.zip` quando solicitado pela UX.
