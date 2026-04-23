# Fluxos — Status atual

Lista viva de todos os fluxos deste repositório. Atualize sempre que criar, modificar ou finalizar um fluxo.

**Legenda de status:**
- 🟡 **Rascunho** — em construção, não abrir pra validação externa
- 🟠 **Em revisão** — pronto pra stakeholders comentarem
- 🟢 **Aprovado** — validado e pronto pra dev

---

## Exemplos do catálogo inicial

Estes entraram no `wwwroot/mocks/fluxos.json` só pra popular a home e servirem de inspiração. Substitua pelos fluxos reais conforme forem criados.

| Fluxo | Status | Telas | Última atualização | Pasta |
|-------|--------|------:|--------------------|-------|
| Onboarding de colaborador | 🟡 Rascunho | 4 | 22/04/2026 | _(ainda não criada)_ |
| Dashboard operacional | 🟡 Rascunho | 1 | 20/04/2026 | _(ainda não criada)_ |
| Aprovação de solicitação | 🟠 Em revisão | 3 | 18/04/2026 | _(ainda não criada)_ |
| Cadastro de fornecedor | 🟢 Aprovado | 5 | 10/04/2026 | _(ainda não criada)_ |

---

## Como adicionar um novo fluxo

1. Criar pasta `src/Prototipos/Pages/fluxos/<nome-do-fluxo>/`.
2. Criar arquivos `.razor` numerados pras telas (ex: `01-boas-vindas.razor`, `02-cadastro.razor`).
3. Cada `.razor` começa com `@page "/fluxos/<nome-do-fluxo>/<slug-da-tela>"`.
4. Criar `README.md` dentro da pasta com:
   - Objetivo (uma frase)
   - Personas envolvidas
   - Pré-condições
   - Status atual
   - Decisões de design
   - Pontos de atenção pra dev
5. Adicionar o fluxo em `wwwroot/mocks/fluxos.json` (aparece na home automaticamente).
6. Atualizar esta tabela.
