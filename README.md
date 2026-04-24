# Protótipos UX — Cooperativa Lar

Repositório central dos protótipos navegáveis e documentação de UX da Lar.
Mantido pela equipe de UX Design e consultado pelas equipes de desenvolvimento.

## O que tem aqui

```
prototipos/
├── design-system/   → Design System institucional (Blazor/Radzen)
├── apps/            → um subprojeto por aplicativo da Lar
│   ├── lar-digital/
│   ├── fomentos/
│   ├── larnet/
│   ├── gerenciamento-notas-despesas/
│   └── _template/   → esqueleto pra copiar quando surgir app novo
├── shared/          → ícones e fontes reutilizados entre apps
└── docs/            → padrões de UX, processo, histórico de decisões
```

## Fluxo de trabalho

**Designer**
1. Criar/editar telas dentro da pasta do app: `apps/<nome-do-app>/`
2. Exportar mockups Figma pra `apps/<nome>/telas/`
3. Escrever o código do protótipo navegável em `apps/<nome>/prototipos/`
4. Commit + push na mesma branch ou numa feature branch por fluxo

**Desenvolvedor**
- Entrar em `apps/<nome>/prototipos/` pra ver o código das telas
- Consultar `design-system/docs/` pra ver os tokens de cores/tipografia/componentes
- Os protótipos usam **Blazor + Radzen Material** — mesmo stack do DS

## Criar um app novo

```bash
cp -r apps/_template apps/<nome-do-novo-app>
```

Depois edite o `README.md` da pasta nova com o nome real do app.

## Design System

Os tokens, logos e componentes vivem em [`design-system/`](./design-system).
A página interativa do DS roda localmente com:

```bash
cd design-system/src/Prototipos
dotnet run
```

E abre em `http://localhost:5000/design-system`.
