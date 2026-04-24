# Processo de trabalho — UX Lar

## Ciclo de entrega

```
Pesquisa → Figma (mockups) → Protótipo navegável → Review com usuário → Handoff dev
                                    ↑
                     este repo vive aqui
```

## Como eu (UX) uso este repo

1. **Novo app ou fluxo?** Copio `apps/_template/` com nome novo.
2. **Desenhei no Figma?** Exporto PNGs pra `apps/<app>/telas/` — serve de referência visual durante implementação do protótipo.
3. **Vou codar o protótipo?** Trabalho em `apps/<app>/prototipos/`, usando os componentes do `design-system/`.
4. **Fluxo documentado?** Escrevo em markdown em `apps/<app>/fluxos/<nome-do-fluxo>.md`.
5. **Commit com mensagem clara** — ex: `feat(notas-despesas): tela de aprovação do gestor`.

## Como o time de dev consulta

- Código do protótipo: `apps/<app>/prototipos/`
- Tokens (cor, tipografia, espaçamento): `design-system/docs/design-system-blazor.md`
- Componentes prontos: `design-system/src/Prototipos/Pages/design-system/`
- Fluxos (regras de negócio visuais): `apps/<app>/fluxos/`

## Convenções de nomenclatura

- Pastas de app em **kebab-case**: `gerenciamento-notas-despesas`
- Arquivos de telas: `NN-nome-tela.razor` (ex: `01-lista-notas.razor`)
- Commits seguem [Conventional Commits](https://www.conventionalcommits.org):
  - `feat`: tela ou fluxo novo
  - `fix`: correção de protótipo
  - `docs`: só documentação
  - `style`: ajuste visual sem mudar comportamento

## Revisão

- Toda mudança deve ser commitada com mensagem descritiva
- Quando for uma feature grande, criar branch `feat/<nome>` e fazer merge quando estiver revisado
