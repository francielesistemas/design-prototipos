# Padrões de UX — Lar

Checklist e heurísticas que uso ao desenhar/revisar telas dos apps da Lar.

## Checklist rápido (antes de dar "pronto")

- [ ] Usa apenas cores do [Design System](../design-system/docs/design-system-blazor.md)
- [ ] Tipografia CentraleSansRnd com fallback Inter
- [ ] Estados interativos (hover, focus, active, disabled) visíveis em todos os botões e inputs
- [ ] Contraste mínimo AA em textos
- [ ] Feedback visual em ações (loading, success, erro)
- [ ] Mensagens de erro claras, com ação sugerida (não só "Erro")
- [ ] Fluxo funciona no mobile (se aplicável)

## Heurísticas de Nielsen (lembrete)

1. Visibilidade do status do sistema
2. Correspondência com o mundo real
3. Controle e liberdade do usuário
4. Consistência e padrões
5. Prevenção de erros
6. Reconhecimento em vez de memorização
7. Flexibilidade e eficiência
8. Design minimalista
9. Recuperação de erros
10. Ajuda e documentação

## Padrões específicos da Lar

### Cor primária
O **vermelho Lar (#E40046)** é a cor de ação principal. Use em:
- Botão primário da tela (o CTA)
- Indicadores de seleção/ativo
- Destaques críticos

Evite usar vermelho pra ícones de erro — pra erro use `--rz-danger` (#CC3043), que é levemente diferente.

### Cor por área
Cada área de negócio tem paleta própria (Agro, Foods, Supermercados). Quando um protótipo é específico de uma área, trocar o primary escopado na pasta, não global.

### Densidade
- **Telas corporativas (backoffice)**: densas, muita informação, tabelas
- **Telas cooperado (app, portal)**: mais espaçadas, foco em clareza
