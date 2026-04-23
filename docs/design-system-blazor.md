# Design System — Radzen Blazor Material Theme

> Especificação técnica destilada do UI kit **Radzen Blazor Material Theme (Community)** no Figma.
> Use este documento como **fonte única de verdade** para gerar protótipos navegáveis fiéis ao design system.

- **Fonte Figma:** `Radzen Blazor Material Theme UI kit (Community)` (file key `92wd0itIpURk6iHuNmSzq7`)
- **Base conceitual:** Material Design + Radzen Blazor (prefixo CSS `--rz-*`)
- **Totais:** 129 componentes, 2.449 component sets, 19 text styles, 10 effect styles
- **Gerado em:** 22/04/2026

---

## 1. Princípios de uso

1. **Todas as cores, espaçamentos e tipografias** usados em protótipos **devem** vir deste arquivo. Não invente valores.
2. **Prefixo Radzen:** classes e variáveis CSS do framework usam o prefixo `rz-`/`--rz-*` (ex.: `rz-button`, `--rz-primary`). Mantenha esse padrão ao gerar markup.
3. **Hierarquia semântica de cor:** sempre `Primary / Secondary / Info / Success / Warning / Danger` + shades (`Lighter, Light, Default, Dark, Darker`).
4. **Estados obrigatórios em interativos:** `Default, Hover, Active, Focus, Disabled` (e `Busy` quando aplicável).
5. **Radius padrão:** `4px` para quase todos os componentes (botões, badges, cards, dialogs, alerts, inputs).
6. **Tipografia base:** `CentraleSansRnd`. Em protótipos web, use fallback `"Inter", "Roboto", "Segoe UI", sans-serif`.
7. **Light + Dark + Base:** cada família de componente tem 3 shades de tema (`Light`, `Dark`, `Base/Default`). Implemente ambos os modos.

---

## 2. Paleta de cores

### 2.1. Cores semânticas (brand)

Paleta de 5 shades por intenção semântica. Nomes seguem o padrão Radzen (`Lighter → Light → Default → Dark → Darker`).

| Intenção      | Lighter   | Light     | Default   | Dark      | Darker    |
|---------------|-----------|-----------|-----------|-----------|-----------|
| **Primary**   | `#E1445F` | `#E1445F` | `#DB2040` | `#B81B36` | `#A3122B` |
| **Secondary** | `#EEEEEE` | `#EEEEEE` | `#E0E0E0` | `#BDBDBD` | `#9E9E9E` |
| **Info**      | `#295CB3` | `#295CB3` | `#003DA5` | `#00338A` | `#00276B` |
| **Success**   | `#538E56` | `#538E56` | `#327836` | `#2A652D` | `#1C471E` |
| **Warning**   | `#EFB06F` | `#EFB06F` | `#ECA154` | `#C68746` | `#A36B31` |
| **Danger**    | `#D45161` | `#D45161` | `#CC3043` | `#AB2838` | `#8E1E2C` |

> Primary do Radzen é um vermelho-magenta (`#DB2040`). Secondary é um cinza. Info é azul. Os demais seguem a semântica tradicional do Material.

### 2.2. Superfícies (backgrounds e layout)

| Token                | Hex         | Uso                                                   |
|----------------------|-------------|-------------------------------------------------------|
| `--rz-base-0`        | `#FFFFFF`   | Superfície principal (Card, Dialog, Panel, inputs)    |
| `--rz-base-50`       | `#FAFAFA`   | Background geral da aplicação (Body/Footer)           |
| `--rz-base-100`      | `#F5F5F5`   | Superfície alternada (cell-data, hover sutil)         |
| `--rz-base-200`      | `#EEEEEE`   | Divisores/hover de item de lista                       |
| `--rz-base-300`      | `#E0E0E0`   | Bordas sutis / secondary default                       |
| `--rz-base-400`      | `#BDBDBD`   | Placeholders, estados desabilitados                    |
| `--rz-base-500`      | `#9E9E9E`   | Ícones inativos, labels secundários                   |
| `--rz-base-600`      | `#757575`   | Texto secundário                                       |
| `--rz-base-700`      | `#616161`   | Texto enfático secundário                              |
| `--rz-base-800`      | `#424242`   | Texto principal em light mode                          |
| `--rz-base-900`      | `#212121`   | Texto de máximo contraste / superfície dark            |
| `--rz-base-background-dark` | `#212121` | Background de componentes em Dark shade           |
| `--rz-text-default`  | `#424242`   | Cor de texto padrão                                    |
| `--rz-text-on-dark`  | `#FFFFFF`   | Texto sobre fundos escuros                             |

### 2.3. Alphas (estados)

Estes overlays aparecem repetidamente — use-os em `:hover`, `:active`, `:focus`, seleções.

| Alpha overlay        | Valor                  | Uso típico                            |
|----------------------|------------------------|---------------------------------------|
| Primary @ 16%        | `rgba(219, 32, 64, 0.16)`   | Seleção/active de item (DataGrid)     |
| Primary @ 20%        | `rgba(219, 32, 64, 0.20)`   | Hover em estados primários            |
| Info @ 20%           | `rgba(0, 61, 165, 0.20)`    | Accordion header expandido / hover    |
| Success @ 16%        | `rgba(50, 120, 54, 0.16)`   | Fundo sutil em alerts success         |
| Warning @ 20%        | `rgba(236, 161, 84, 0.20)`  | Fundo sutil em alerts warning         |
| Danger @ 20%         | `rgba(204, 48, 67, 0.20)`   | Fundo sutil em alerts danger          |
| White @ 12%          | `rgba(255, 255, 255, 0.12)` | Hover em botão Light                  |
| White @ 20%          | `rgba(255, 255, 255, 0.20)` | Hover em botão Filled (overlay)       |
| Black @ 4%           | `rgba(0, 0, 0, 0.04)`       | Hover muito sutil (PanelMenu)          |
| Black @ 12%          | `rgba(0, 0, 0, 0.12)`       | Hover em botão Dark                    |
| Base-300 @ 30%       | `rgba(224, 224, 224, 0.30)` | Estado disabled (botões, inputs)      |
| Scheduler accent     | `rgba(255, 220, 40, 0.20)`  | Destaque de "hoje" no Scheduler       |

### 2.4. Token CSS export (copiar para `:root`)

```css
:root {
  /* Brand */
  --rz-primary-lighter: #E1445F;
  --rz-primary-light:   #E1445F;
  --rz-primary:         #DB2040;
  --rz-primary-dark:    #B81B36;
  --rz-primary-darker:  #A3122B;

  --rz-secondary-lighter: #EEEEEE;
  --rz-secondary-light:   #EEEEEE;
  --rz-secondary:         #E0E0E0;
  --rz-secondary-dark:    #BDBDBD;
  --rz-secondary-darker:  #9E9E9E;

  --rz-info-lighter: #295CB3;
  --rz-info-light:   #295CB3;
  --rz-info:         #003DA5;
  --rz-info-dark:    #00338A;
  --rz-info-darker:  #00276B;

  --rz-success-lighter: #538E56;
  --rz-success-light:   #538E56;
  --rz-success:         #327836;
  --rz-success-dark:    #2A652D;
  --rz-success-darker:  #1C471E;

  --rz-warning-lighter: #EFB06F;
  --rz-warning-light:   #EFB06F;
  --rz-warning:         #ECA154;
  --rz-warning-dark:    #C68746;
  --rz-warning-darker:  #A36B31;

  --rz-danger-lighter: #D45161;
  --rz-danger-light:   #D45161;
  --rz-danger:         #CC3043;
  --rz-danger-dark:    #AB2838;
  --rz-danger-darker:  #8E1E2C;

  /* Surface / neutrals */
  --rz-base-0:    #FFFFFF;
  --rz-base-50:   #FAFAFA;
  --rz-base-100:  #F5F5F5;
  --rz-base-200:  #EEEEEE;
  --rz-base-300:  #E0E0E0;
  --rz-base-400:  #BDBDBD;
  --rz-base-500:  #9E9E9E;
  --rz-base-600:  #757575;
  --rz-base-700:  #616161;
  --rz-base-800:  #424242;
  --rz-base-900:  #212121;

  --rz-text-color:        #424242;
  --rz-text-secondary:    #757575;
  --rz-text-on-primary:   #FFFFFF;
  --rz-text-disabled:     #9E9E9E;

  --rz-body-background:   #FAFAFA;
  --rz-surface:           #FFFFFF;
  --rz-border-color:      #E0E0E0;
  --rz-divider:           #EEEEEE;
}
```

---

## 3. Tipografia

### 3.1. Família

- **Primária:** `CentraleSansRnd`
- **Fallback web:** `"CentraleSansRnd", "Inter", "Roboto", "Segoe UI", sans-serif`
- **Pesos disponíveis:** Light (300), Book (400), Medium (500), Bold (700)

### 3.2. Escala tipográfica — `rz/text/*` (UI text)

Use esta escala para **textos de interface** (headings dentro de conteúdo, labels, body).

| Token              | Font-size | Line-height | Weight  | Letter-spacing | Uso                                  |
|--------------------|-----------|-------------|---------|----------------|--------------------------------------|
| `rz/text/h1`       | 96 px     | 112 px      | Light   | −1.5 px        | Heading de página raríssimo          |
| `rz/text/h2`       | 60 px     | 72 px       | Light   | −0.5 px        | Heading principal                    |
| `rz/text/h3`       | 48 px     | 56 px       | Book    | 0              | Seção grande                         |
| `rz/text/h4`       | 34 px     | 36 px       | Book    | +0.25 px       | Título de página                     |
| `rz/text/h5`       | 24 px     | auto        | Book    | 0              | Sub-seção                            |
| `rz/text/h6`       | 20 px     | 24 px       | Medium  | +0.15 px       | Título de card/bloco                 |
| `rz/text/subtitle1`| 16 px     | 24 px       | Medium  | +0.15 px       | Título de linha/item                 |
| `rz/text/subtitle2`| 14 px     | 20 px       | Medium  | +0.10 px       | Sub-título compacto                  |
| `rz/text/body1`    | 16 px     | 24 px       | Book    | +0.5 px        | Parágrafo padrão                     |
| `rz/text/body2`    | 14 px     | 24 px       | Book    | +0.25 px       | Texto secundário / densos (forms)    |
| `rz/text/button`   | 14 px     | 16 px       | Medium  | +1.25 px       | Label de botão (ALL CAPS não é obrigatório, mantém Case original) |
| `rz/text/caption`  | 12 px     | 16 px       | **Bold**| +0.4 px        | Caption, hints, badges               |
| `rz/text/overline` | 10 px     | 12 px       | Book    | +1 px          | Eyebrow, `TEXT-TRANSFORM: UPPERCASE` |

### 3.3. Escala tipográfica — `rz/display/*` (display)

Mesma escala numérica, porém destinada a **hero/display**. Use em páginas de marketing, splash, empty states grandes.

| Token              | Font-size | Line-height | Weight  |
|--------------------|-----------|-------------|---------|
| `rz/display/h1`    | 96 px     | 112 px      | Light   |
| `rz/display/h2`    | 60 px     | 72 px       | Light   |
| `rz/display/h3`    | 48 px     | 56 px       | Book    |
| `rz/display/h4`    | 34 px     | 36 px       | Book    |
| `rz/display/h5`    | 24 px     | 24 px       | Book    |
| `rz/display/h6`    | 20 px     | 24 px       | Medium  |

### 3.4. CSS pronto

```css
/* Exemplo: rz/text/button */
.rz-button-label {
  font-family: "CentraleSansRnd", "Inter", sans-serif;
  font-size: 14px;
  line-height: 16px;
  font-weight: 500;
  letter-spacing: 1.25px;
}

.rz-overline {
  font-family: "CentraleSansRnd", "Inter", sans-serif;
  font-size: 10px;
  line-height: 12px;
  font-weight: 400;
  letter-spacing: 1px;
  text-transform: uppercase;
}
```

---

## 4. Espaçamento e layout

O kit não expõe tokens explícitos de spacing, mas os componentes usam uma **grade de 4 px**. Derive suas medidas destes valores observados:

| Token | Valor | Uso típico |
|-------|-------|------------|
| `--rz-space-1` | `4 px`  | gap mínimo, padding de badge |
| `--rz-space-2` | `8 px`  | padding vertical de botão Medium, gap em Alert Text |
| `--rz-space-3` | `12 px` | padding horizontal de botão Small |
| `--rz-space-4` | `16 px` | padding de Card, Alert, Dialog; gap padrão |
| `--rz-space-5` | `20 px` | — |
| `--rz-space-6` | `24 px` | padding horizontal de botão Large |
| `--rz-space-8` | `32 px` | seções de conteúdo |
| `--rz-space-10`| `40 px` | hero, seções grandes |

**Radius padrão:** `--rz-border-radius: 4px` (praticamente universal). Use `0` só para tabelas/scheduler e `50%` para Gravatar/FAB redondo.

---

## 5. Elevação (sombras)

Escala de 10 níveis de sombra, idêntica ao Material Elevation. Todas compõem 3 drop-shadows empilhados com opacidades `0.14` + `0.12` + `0.14`.

| Token         | CSS `box-shadow`                                                                                              | Uso                            |
|---------------|---------------------------------------------------------------------------------------------------------------|--------------------------------|
| `rz/shadow-1` | `0 1px 1px rgba(0,0,0,.14), 0 2px 1px rgba(0,0,0,.12), 0 1px 3px rgba(0,0,0,.14)`                             | Chip, badge elevado            |
| `rz/shadow-2` | `0 2px 2px rgba(0,0,0,.14), 0 3px 1px rgba(0,0,0,.12), 0 1px 5px rgba(0,0,0,.14)`                             | Card, TextBox focado           |
| `rz/shadow-3` | `0 3px 4px rgba(0,0,0,.14), 0 3px 3px rgba(0,0,0,.12), 0 1px 8px rgba(0,0,0,.14)`                             | Botão elevado (FAB estático)   |
| `rz/shadow-4` | `0 4px 5px rgba(0,0,0,.14), 0 1px 10px rgba(0,0,0,.12), 0 2px 4px rgba(0,0,0,.14)`                            | AppBar, Header                 |
| `rz/shadow-5` | `0 6px 10px rgba(0,0,0,.14), 0 1px 18px rgba(0,0,0,.12), 0 3px 5px rgba(0,0,0,.14)`                           | Card em hover                  |
| `rz/shadow-6` | `0 8px 10px rgba(0,0,0,.14), 0 3px 14px rgba(0,0,0,.12), 0 5px 5px rgba(0,0,0,.14)`                           | Menu, Popover                  |
| `rz/shadow-7` | `0 9px 12px rgba(0,0,0,.14), 0 3px 16px rgba(0,0,0,.12), 0 5px 6px rgba(0,0,0,.14)`                           | FAB em hover                   |
| `rz/shadow-8` | `0 12px 17px rgba(0,0,0,.14), 0 5px 22px rgba(0,0,0,.12), 0 7px 8px rgba(0,0,0,.14)`                          | Dialog padrão                  |
| `rz/shadow-9` | `0 16px 24px rgba(0,0,0,.14), 0 6px 30px rgba(0,0,0,.12), 0 8px 10px rgba(0,0,0,.14)`                         | Dialog com ênfase              |
| `rz/shadow-10`| `0 24px 38px rgba(0,0,0,.14), 0 9px 46px rgba(0,0,0,.12), 0 11px 15px rgba(0,0,0,.14)`                        | Modal/sheet grande (máximo)    |

```css
:root {
  --rz-shadow-1: 0 1px 1px rgba(0,0,0,.14), 0 2px 1px rgba(0,0,0,.12), 0 1px 3px rgba(0,0,0,.14);
  --rz-shadow-2: 0 2px 2px rgba(0,0,0,.14), 0 3px 1px rgba(0,0,0,.12), 0 1px 5px rgba(0,0,0,.14);
  --rz-shadow-3: 0 3px 4px rgba(0,0,0,.14), 0 3px 3px rgba(0,0,0,.12), 0 1px 8px rgba(0,0,0,.14);
  --rz-shadow-4: 0 4px 5px rgba(0,0,0,.14), 0 1px 10px rgba(0,0,0,.12), 0 2px 4px rgba(0,0,0,.14);
  --rz-shadow-5: 0 6px 10px rgba(0,0,0,.14), 0 1px 18px rgba(0,0,0,.12), 0 3px 5px rgba(0,0,0,.14);
  --rz-shadow-6: 0 8px 10px rgba(0,0,0,.14), 0 3px 14px rgba(0,0,0,.12), 0 5px 5px rgba(0,0,0,.14);
  --rz-shadow-7: 0 9px 12px rgba(0,0,0,.14), 0 3px 16px rgba(0,0,0,.12), 0 5px 6px rgba(0,0,0,.14);
  --rz-shadow-8: 0 12px 17px rgba(0,0,0,.14), 0 5px 22px rgba(0,0,0,.12), 0 7px 8px rgba(0,0,0,.14);
  --rz-shadow-9: 0 16px 24px rgba(0,0,0,.14), 0 6px 30px rgba(0,0,0,.12), 0 8px 10px rgba(0,0,0,.14);
  --rz-shadow-10: 0 24px 38px rgba(0,0,0,.14), 0 9px 46px rgba(0,0,0,.12), 0 11px 15px rgba(0,0,0,.14);
}
```

---

## 6. Catálogo de componentes

Lista completa, agrupada por domínio Radzen. Cada item tem: **nome**, **uso**, **props de variante**, e, quando aplicável, **spec visual** (dimensões, padding, radius).

### 6.1. Forms (formulários)

#### Button (`rz-button`)

A família mais rica: **49 component sets** cobrindo 4 variantes visuais × shade (Default/Light/Dark) × estados inclusive `Busy`.

**Variantes visuais (prop `Variant`):**

- `Filled` — fundo preenchido com a cor semântica, texto branco.
- `Outlined` — fundo transparente, borda 1 px na cor semântica, texto na cor semântica.
- `Text` — sem fundo, sem borda, só texto colorido (usado em `TextButton`).
- `Flat` — fundo colorido (como Filled) mas **sem sombra**.

**Props de variante:**

| Prop     | Valores |
|----------|---------|
| `State`  | `Default`, `Hover`, `Active`, `Focus`, `Disable`, `Busy` |
| `Size`   | `ExtraSmall`, `Small`, `Medium`, `Large` |
| `Style`  | `Primary`, `Secondary`, `Info`, `Success`, `Warning`, `Danger` |
| `Shade`  | `Lighter`, `Light`, `Default`, `Dark`, `Darker` |

**Sizing (Filled, Primary, Default):**

| Size        | Width (auto) | Height | Padding (y×x)  | Font          |
|-------------|--------------|--------|----------------|---------------|
| ExtraSmall  | auto         | 24 px  | 4 × 8 px       | rz/text/button |
| Small       | auto         | 28 px  | 6 × 12 px      | rz/text/button |
| Medium      | auto         | 36 px  | 8 × 16 px      | rz/text/button |
| Large       | auto         | 48 px  | 12 × 24 px     | rz/text/button |

**Radius:** `4 px` (todos os tamanhos).
**Gap entre ícone e label:** `10 px`.

**CSS-template mínimo:**

```css
.rz-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  padding: 8px 16px;         /* Medium */
  border-radius: 4px;
  border: 1px solid transparent;
  font: var(--rz-font-button, 500 14px/16px "CentraleSansRnd");
  letter-spacing: 1.25px;
  cursor: pointer;
  transition: background .15s, box-shadow .15s, color .15s;
}

/* Filled Primary */
.rz-button--filled.rz-button--primary {
  background: var(--rz-primary);
  color: #fff;
  box-shadow: var(--rz-shadow-2);
}
.rz-button--filled.rz-button--primary:hover   { box-shadow: var(--rz-shadow-4); background: var(--rz-primary-dark); }
.rz-button--filled.rz-button--primary:active  { box-shadow: var(--rz-shadow-8); }
.rz-button--filled.rz-button--primary:focus   { outline: 2px solid rgba(219,32,64,.20); outline-offset: 2px; }
.rz-button--filled.rz-button--primary[disabled] {
  background: rgba(224,224,224,.30);
  color: var(--rz-text-disabled);
  box-shadow: none;
  cursor: not-allowed;
}

/* Outlined Primary */
.rz-button--outlined.rz-button--primary {
  background: transparent;
  border-color: var(--rz-primary);
  color: var(--rz-primary);
}
.rz-button--outlined.rz-button--primary:hover { background: rgba(219,32,64,.16); }

/* Text Primary */
.rz-button--text.rz-button--primary {
  background: transparent;
  border-color: transparent;
  color: var(--rz-primary);
}
.rz-button--text.rz-button--primary:hover { background: rgba(219,32,64,.16); }

/* Flat = Filled sem sombra */
.rz-button--flat.rz-button--primary {
  background: var(--rz-primary);
  color: #fff;
  box-shadow: none;
}
```

**Composições auxiliares:**
- **FAB** (Floating Action Button) — apenas na família `Button Filled/Content in Buttons/FAB`, 200 variantes. Radius `50%`, tamanho quadrado, ícone central, `box-shadow: var(--rz-shadow-3)` em repouso / `--rz-shadow-7` em hover.
- **Busy** — estado com spinner circular substituindo o label, mesmo tamanho e cor do botão.

#### SplitButton

Botão dividido em duas áreas: ação primária + dropdown. **48 component sets**, mesmas combinações (Filled/Outlined/Text/Flat × Shade × Style × Size). Mesmos tokens do Button — o dropdown "handle" é um botão secundário colado à direita com borda vertical 1 px `--rz-base-200`.

#### TextBox

Campo de texto base.

| Set                 | Width  | Height | Uso                                  |
|---------------------|--------|--------|--------------------------------------|
| `TextBox_default`   | 228 px | 40 px  | Campo standalone (linha simples)     |
| `TextBox_FormField` | 228 px | 56 px  | Campo com label flutuante (Material) |

**Props:**
- `State`: `Default, Hover, Active, Focus, Filled, Error, Disable`
- `Placeholder`: `True/False`
- `Icon`: `None, Left, Right, Both`
- Variante `FormField` inclui `Variant`: `Filled` (fundo `#F8F8F8`) e `Standard` (apenas linha inferior).

**CSS-template:**

```css
.rz-textbox {
  width: 228px;
  height: 40px;
  padding: 8px 12px;
  border: 1px solid var(--rz-base-300);
  border-radius: 4px;
  background: #fff;
  font: 400 14px/24px "CentraleSansRnd";
  color: var(--rz-text-color);
  transition: border-color .15s, box-shadow .15s;
}
.rz-textbox::placeholder        { color: var(--rz-base-400); }
.rz-textbox:hover               { border-color: var(--rz-base-500); }
.rz-textbox:focus               { border-color: var(--rz-primary); outline: none; box-shadow: 0 0 0 3px rgba(219,32,64,.16); }
.rz-textbox--error              { border-color: var(--rz-danger); }
.rz-textbox:disabled            { background: #F5F5F5; color: var(--rz-text-disabled); border-color: var(--rz-base-200); cursor: not-allowed; }
```

**Variantes relacionadas:** `TextArea` (4 variantes, altura maior, `resize: vertical`), `Numeric`, `Password`, `AutoComplete`, `DatePicker`, `ColorPicker`, `Dropdown`, `DropDownDataGrid`, `FileInput`, `HtmlEditor` — **todas compartilham o mesmo wrapper `FormField`** com 56 px, padding lateral 12 px, label flutuante 12 px em repouso e 10 px no topo quando o campo está preenchido/focado.

#### CheckBox

- Tamanho: `20 × 20 px`, radius `2 px`.
- Borda: `2 px solid var(--rz-base-400)` em default.
- Checked: `background: var(--rz-primary)`, ícone de check `#FFF`.
- Focus ring: `box-shadow: 0 0 0 10px rgba(219,32,64,.12)` (ripple).

#### RadioButtonList — 13 sets com orientação (`horizontal`, `vertical`) e tamanhos (`x1…x10` = quantidade de itens).
- Radio: `20 × 20 px`, radius `50%`, borda `2 px solid var(--rz-base-400)`.
- Checked: inner dot `10 × 10 px` preenchida com `--rz-primary`.

#### Switch — 2 sets (`x1`, `x2`).
- Track: `32 × 14 px`, radius `7 px`, cor `--rz-base-400` (off) / `rgba(219,32,64,.50)` (on).
- Thumb: `20 × 20 px`, radius `50%`, sombra `--rz-shadow-1`, cor `#FFF` (off) / `--rz-primary` (on).

#### Rating — escala de estrelas, 12 sets variando tamanho (Small/Medium/Large) e cor.

#### SelectBar / SegmentedControl — 11 sets.
- Group pill com `border-radius: 4px`, botões internos sem radius.
- Item selecionado: fundo `--rz-primary`, texto `#FFF`.
- Item default: fundo transparente, texto `--rz-base-800`.

#### Slider — 3 sets.
- Track: `4 px` altura, `--rz-base-300` (off) / `--rz-primary` (filled).
- Thumb: `14 × 14 px` radius `50%`, cor `--rz-primary`, ripple em hover.

#### CheckBoxList, ListBox, DropDownDataGrid, Fieldset, FormField, TemplateForm, Upload, SpeechToTextButton
Compartilham os mesmos tokens de `TextBox_FormField`. Consulte o Figma pelo nodeId quando precisar de spec exata.

### 6.2. Layout

| Componente | Dimensão padrão | Radius | Sombra | Padding | Observações |
|------------|-----------------|--------|--------|---------|-------------|
| **Card**   | 370 × 172 px (auto) | 4 px | `--rz-shadow-2` | 16 px | Layout horizontal por padrão. Variantes: `Filled`, `Outlined`. |
| **Dialog** | 512 × 256 px (auto) | 4 px | `--rz-shadow-8` | 0 px wrapper → header/body/footer controlam padding interno | Variantes: `Default, Closable, Draggable, Resizable`. Backdrop `rgba(0,0,0,.50)`. |
| **Panel**  | auto × auto         | 4 px | `--rz-shadow-1` | 16 px | Com `header` 48 px e body colapsável. |
| **Splitter**| variável, divisor 4 px | 0 | nenhuma | — | Horizontal/Vertical. |
| **Layout** | página completa | 0 | — | — | Sub-componentes: `Header` (64 px, `--rz-shadow-4`), `Sidebar` (240 px), `Body`, `Footer` (48 px), `RightSidebar`. |

#### Card — CSS
```css
.rz-card {
  background: #fff;
  border-radius: 4px;
  padding: 16px;
  box-shadow: var(--rz-shadow-2);
  display: flex;
  gap: 16px;
}
.rz-card--outlined { box-shadow: none; border: 1px solid var(--rz-base-300); }
.rz-card:hover    { box-shadow: var(--rz-shadow-5); }
```

#### Dialog — CSS
```css
.rz-dialog {
  width: 512px;
  max-height: 80vh;
  background: #fff;
  border-radius: 4px;
  box-shadow: var(--rz-shadow-8);
  display: flex; flex-direction: column;
}
.rz-dialog__header  { padding: 16px 24px; font: 500 20px/24px "CentraleSansRnd"; }
.rz-dialog__body    { padding: 8px 24px 16px; font: 400 14px/24px "CentraleSansRnd"; color: var(--rz-base-800); }
.rz-dialog__footer  { padding: 8px 24px 16px; display: flex; justify-content: flex-end; gap: 8px; }
.rz-dialog-backdrop { background: rgba(0,0,0,.50); backdrop-filter: blur(2px); }
```

### 6.3. Navigation

| Componente     | Descrição                                                                |
|----------------|--------------------------------------------------------------------------|
| **Menu**       | Menu horizontal top. Altura 48 px, item padding `0 16px`, hover `--rz-base-200`. |
| **ContextMenu**| Menu popup. Shadow `--rz-shadow-6`, min-width 160 px, item 32 px altura. |
| **PanelMenu**  | Menu lateral expansível. Item altura 48 px, ativo tem fundo `rgba(0,61,165,.20)` e borda lateral esquerda 3 px `--rz-info`. |
| **ProfileMenu**| Menu vertical com avatar, invocado por trigger circular.                 |
| **BreadCrumb** | Altura 32 px, separador `/` em `--rz-base-500`, último item em `--rz-base-900`. |
| **Link**       | Texto `--rz-primary`, `text-decoration: none` em repouso, underline em hover. |
| **Tabs**       | 10 variantes (horizontal/vertical × tipo pill/underline). Underline bottom `2 px solid --rz-primary` para o ativo. |
| **Steps**      | Stepper horizontal, 10 sets (x1…x10 = quantidade de passos). Círculo 32×32 px, ativo `--rz-primary`, completo `--rz-success`, inativo `--rz-base-400`. |
| **Accordion**  | Header expandido: fundo `rgba(0,61,165,.20)`, ícone rotaciona 180°. Border-bottom `1 px --rz-base-200`. |
| **Login**      | Template de página, 5 variantes. Card centralizado 360 px. |

### 6.4. Feedback

#### Alert

**16 component sets:** 4 variantes visuais (`Filled, Flat, Outlined, Text`) × 4 shades (`Default, Light, Dark, Base`).

**Props dentro de cada set:** `AlertStyle` (Primary, Secondary, Info, Success, Warning, Danger), `Size` (Small, Medium, Large), `Shade`.

**Spec:**
- Dimensão base: `300 × 88 px` (Medium, largura varia com o conteúdo).
- Padding: `16 px` nos quatro lados.
- Gap interno: `16 px` entre ícone, texto e close button.
- Radius: `4 px`, borda `1 px` (só em `Outlined`).

**CSS-template (Alert Filled Success):**
```css
.rz-alert {
  display: flex;
  gap: 16px;
  align-items: flex-start;
  padding: 16px;
  border-radius: 4px;
  font: 400 14px/20px "CentraleSansRnd";
}
.rz-alert--filled.rz-alert--success   { background: var(--rz-success); color: #fff; }
.rz-alert--outlined.rz-alert--success { background: transparent; color: var(--rz-success); border: 1px solid var(--rz-success); }
.rz-alert--flat.rz-alert--success     { background: rgba(50,120,54,.16); color: var(--rz-success-darker); }
.rz-alert--text.rz-alert--success     { background: transparent; padding: 0; color: var(--rz-success); }
.rz-alert__icon  { flex-shrink: 0; width: 24px; height: 24px; }
.rz-alert__title { font-weight: 500; font-size: 16px; line-height: 24px; letter-spacing: .15px; }
.rz-alert__close { margin-left: auto; cursor: pointer; opacity: .7; }
```

#### Notification (toast)
- 2 sets, 3 variantes. Posições: top-right padrão.
- Dimensão: 360 × auto, padding 16 px, radius 4 px, sombra `--rz-shadow-6`.
- Auto-dismiss configurável; mesma paleta semântica do Alert.

#### Badge

**3 sets:** `Default`, `Light`, `Dark`.

**Props:** `Variant` (Flat, Filled, Outlined), `Style` (Primary…Danger), `Shade`, `Pill` (boolean).

**Spec:**
- Altura padrão: `20 px`, padding `2 × 4 px`, radius `4 px` (ou 999 px se `Pill=True`).
- Gap: `4 px`.
- Font: `rz/text/caption` (12 px Bold, letter-spacing +0.4px).

```css
.rz-badge {
  display: inline-flex; align-items: center; gap: 4px;
  padding: 2px 4px; border-radius: 4px;
  font: 700 12px/16px "CentraleSansRnd"; letter-spacing: .4px;
}
.rz-badge--pill    { border-radius: 999px; padding: 2px 8px; }
.rz-badge--primary { background: var(--rz-primary); color: #fff; }
.rz-badge--light   { background: var(--rz-base-200); color: var(--rz-base-800); }
.rz-badge--dark    { background: var(--rz-base-900); color: #fff; }
```

#### ProgressBar / ProgressBarCircular
- Bar: altura `4 px`, track `--rz-base-300`, fill `--rz-primary`. Variante `striped` animada.
- Circular: diâmetros 24/32/48 px, stroke-width 4 px.

#### Tooltip
- Fundo `--rz-base-900`, texto `#FFF`, font `rz/text/caption`, padding `4 × 8 px`, radius `4 px`, sombra `--rz-shadow-2`. Seta 6 px.

### 6.5. Data

| Componente | Uso | Spec resumido |
|-----------|-----|----------------|
| **DataGrid** | Tabela com 7 component sets (cell, column title, selected, default). Column title 40 px altura, font `rz/text/subtitle2`. Row altura 40 px. Seleção: `rgba(219,32,64,.16)`. Divisor vertical `1 px --rz-base-200`. |
| **DataList** | Lista em cards empilhados. Cada row ~72 px altura. |
| **DataFilter** | Toolbar de filtros acima de DataGrid/DataList. Altura 56 px, fundo `--rz-base-50`. |
| **Pager** | 10 variantes (x1…x10 páginas). Botão 32×32 px, radius 4 px, ativo `--rz-primary`. |
| **Scheduler** | Calendar/Planner views. Hoje: `rgba(255,220,40,.20)`. Evento: pill com cor semântica da categoria. |
| **Tree** | Hierárquica expansível. Item 32 px altura, indent 16 px por nível. |

### 6.6. Images

- **Gravatar** — avatar circular, diâmetros 24/32/40/48/64 px, radius 50%.
- **Image** — wrapper com placeholder, radius configurável (default 4 px).

### 6.7. Data Visualization

- **GoogleMap** — wrapper com controles customizados. Não incluído no escopo de prototipagem inicial.

### 6.8. Miscellaneous (`⚙️`)

- **Label** — label de form-field (12 px `--rz-base-600` em repouso, 10 px `--rz-primary` quando floating/focado).
- **Scrollbar** — scroll custom fino: track 8 px `--rz-base-100`, thumb `--rz-base-400`.
- **Under_form** — hint text + error message 12 px abaixo do input.
- **Validator** — mensagem de validação (12 px `--rz-danger`).
- **Cursor_visualization** — overlay de caret.
- **Content_place** — placeholders de layout.
- **Presentation** — componentes de uso interno do kit.

---

## 7. Regras para prototipagem

### 7.1. Stack sugerida para protótipos navegáveis

- **Web / React:** Tailwind CSS com `theme.extend` mapeando os tokens `--rz-*` ou componentes Radzen em React (via wrapper) — ou classes puras aplicando este arquivo.
- **Web / Blazor:** importe Radzen Blazor (`Radzen.Blazor` + `rz-material.css`). Os componentes já seguem estes tokens.
- **Figma → código:** use `figma_get_component_for_development` para puxar specs exatas de um componente específico e componha via `nodeId`.

### 7.2. Checklist de um protótipo fiel

1. **Cores:** usar apenas as cores listadas em §2.4.
2. **Tipografia:** setar `font-family` global para `"CentraleSansRnd", "Inter", sans-serif`. Aplicar a escala §3.2 em todos os textos.
3. **Radius:** valor universal `4px`, exceto Gravatar/FAB (`50%`).
4. **Sombras:** usar somente os 10 níveis de §5.
5. **Estados:** todo elemento interativo precisa ter visual distinto para `hover`, `active`, `focus`, `disabled`.
6. **Dark mode:** swap de `--rz-base-0/50/100/…` para a escala dark (inverter: `--rz-base-0: #212121`, `--rz-text-color: #FFFFFF`, `--rz-surface: #2A2A2A`).
7. **Acessibilidade:** contraste mínimo AA em texto — evite `Warning` default como cor de texto em fundo branco (contraste insuficiente); prefira `Warning-dark` (`#C68746`) ou versão Filled.
8. **Ícones:** o kit usa Material Icons (página `📌 Material_icons`). Use `@material-symbols/svg-400` ou `material-icons` CDN.

### 7.3. Naming rule (ao replicar em código)

Siga o padrão `rz-<componente>--<variante>--<modificador>`:
- `.rz-button.rz-button--filled.rz-button--primary.rz-button--md`
- `.rz-alert.rz-alert--outlined.rz-alert--warning`
- `.rz-card.rz-card--outlined`

---

## 8. Escopo conhecido / limitações deste spec

- O arquivo Figma **não contém variáveis/tokens publicadas** (precisa de plano Enterprise). Todas as cores foram extraídas por varredura dos nodes e validadas nas páginas `Button`, `Alert`, `Badge`, `DataGrid`, `Card`, `Dialog`, `PanelMenu`, `Accordion`, `Steps`, `Login`.
- A paleta semântica foi validada em **~65.000 nós** varridos. Novos tons que apareçam em componentes não mapeados (ex.: GoogleMap, HtmlEditor) devem ser adicionados caso-a-caso consultando o Figma via `figma_get_component_for_development`.
- `PaintStyles` não estão publicadas — as cores são aplicadas diretamente nos nodes, portanto este spec é a fonte canônica.
- Componentes com muitas variantes (Button com 600 combinações) foram inspecionados em amostras representativas: `State=Default` + `Shade=Default` em todos os Styles e Sizes. Os demais estados seguem overlay alpha (§2.3).

---

## 9. Quick reference — tokens mais usados

```css
/* Abertura rápida — cole no :root e você tem 80% do design system */
:root {
  --rz-primary:   #DB2040;
  --rz-info:      #003DA5;
  --rz-success:   #327836;
  --rz-warning:   #ECA154;
  --rz-danger:    #CC3043;
  --rz-secondary: #E0E0E0;

  --rz-text-color:      #424242;
  --rz-text-secondary:  #757575;
  --rz-text-on-primary: #FFFFFF;

  --rz-body-background: #FAFAFA;
  --rz-surface:         #FFFFFF;
  --rz-border-color:    #E0E0E0;

  --rz-border-radius: 4px;
  --rz-font-family:   "CentraleSansRnd", "Inter", "Roboto", sans-serif;

  --rz-shadow-card:   0 2px 2px rgba(0,0,0,.14), 0 3px 1px rgba(0,0,0,.12), 0 1px 5px rgba(0,0,0,.14);
  --rz-shadow-dialog: 0 12px 17px rgba(0,0,0,.14), 0 5px 22px rgba(0,0,0,.12), 0 7px 8px rgba(0,0,0,.14);
}

body {
  font-family: var(--rz-font-family);
  font-size: 14px;
  line-height: 24px;
  color: var(--rz-text-color);
  background: var(--rz-body-background);
  letter-spacing: 0.25px;
}
```

---

## 10. Como consultar um componente específico

Quando precisar de spec pixel-perfect de um componente que não está detalhado aqui (muito raro):

1. No Figma desktop, clique com o botão direito no componente → **Copy link**.
2. Extraia o `node-id` da URL (`?node-id=123-456` → `"123:456"`).
3. Use a chamada MCP:
   ```
   figma_get_component_for_development(nodeId: "123:456")
   ```
   Isso retorna a árvore completa com paddings, radius, fills resolvidos, interações e imagem 2x.

Para componentes profundamente aninhados (DataGrid, DatePicker, HtmlEditor) use `figma_get_component_for_development_deep`.

---

## 11. Extensões Lar — marca institucional e áreas de negócio

Este apêndice **estende** o spec do Radzen Material com a identidade visual da Cooperativa Lar.
Adicionado em 23/04/2026 a partir do manual de marca.

### 11.1. Marca institucional

A primária do sistema (`--rz-primary`) passa a ser o **vermelho oficial da Lar** (Pantone 710 C, `#E40046`), que é o vermelho do coração do logo. A escala `lighter/light/default/dark/darker` foi regerada em cima desse valor.

Também é adicionado um token **marrom institucional** (`--rz-brand-brown: #3B302D`), correspondente à cor do wordmark "Lar" em materiais institucionais.

**Logos disponíveis em `wwwroot/assets/logos/`:**

| Arquivo | Uso |
|---------|-----|
| `lar-symbol-color.svg` | Símbolo (coração + "Lar"), fundo claro |
| `lar-symbol-white.svg` | Símbolo, fundo escuro ou colorido |
| `lar-institucional-color.svg` | Símbolo + "Cooperativa Agroindustrial", fundo claro |
| `lar-institucional-white.svg` | Institucional, fundo escuro |

> Os SVGs atuais são **aproximações** a partir do manual. Substituir pelos SVGs oficiais do marketing mantendo os mesmos nomes de arquivo — todas as referências continuam funcionando.

### 11.2. Paleta Lar Agro

Área de agronegócio. Tons verdes modernos, moderno e referencial ao setor.

| Token | Hex | Pantone |
|-------|-----|---------|
| `--rz-agro-primary-dark`  | `#00594C` | 626 C  |
| `--rz-agro-primary-light` | `#6CC24A` | 360 C  |
| `--rz-agro-secondary-1`   | `#3A913F` | 7740 C |
| `--rz-agro-secondary-2`   | `#DBE442` | 380 C  |
| `--rz-agro-secondary-3`   | `#ECA154` | 157 C  |
| `--rz-agro-secondary-4`   | `#FFB500` | 7549 C |
| `--rz-agro-secondary-5`   | `#F7EA48` | 101 C  |
| `--rz-agro-secondary-6`   | `#E03E52` | 710 C  |

### 11.3. Paleta Lar Foods

Produtos alimentícios. Cores quentes com apelo gastronômico.

| Token | Hex | Pantone |
|-------|-----|---------|
| `--rz-foods-primary-1`   | `#FFB500` | 7549 C |
| `--rz-foods-primary-2`   | `#E40046` | 710 C  |
| `--rz-foods-secondary-1` | `#8A1B61` | 7649 C |
| `--rz-foods-secondary-2` | `#FF7F41` | 164 C  |
| `--rz-foods-secondary-3` | `#ECA154` | 157 C  |
| `--rz-foods-secondary-4` | `#F7EA48` | 101 C  |

### 11.4. Paleta Lar Supermercados

Rede de supermercados da Lar. Paleta ampla pra refletir variedade de produtos e seções.

| Token | Hex | Pantone |
|-------|-----|---------|
| `--rz-super-primary-1`    | `#470A68` | 2617 C |
| `--rz-super-primary-2`    | `#E40046` | 710 C  |
| `--rz-super-secondary-1`  | `#8A1B61` | 7649 C |
| `--rz-super-secondary-2`  | `#FF7F41` | 164 C  |
| `--rz-super-secondary-3`  | `#ECA154` | 157 C  |
| `--rz-super-secondary-4`  | `#FFB500` | 7549 C |
| `--rz-super-secondary-5`  | `#F7EA48` | 101 C  |
| `--rz-super-secondary-6`  | `#DBE442` | 380 C  |
| `--rz-super-secondary-7`  | `#6CC24A` | 360 C  |
| `--rz-super-secondary-8`  | `#3A913F` | 7740 C |
| `--rz-super-secondary-9`  | `#00594C` | 626 C  |
| `--rz-super-secondary-10` | `#003DA5` | 7692 C |
| `--rz-super-secondary-11` | `#0072CE` | 285 C  |
| `--rz-super-secondary-12` | `#418FDE` | 279 C  |
| `--rz-super-secondary-13` | `#9BCBEB` | 291 C  |

### 11.5. Consumo nos protótipos

- Produtos voltados à **marca institucional** usam `--rz-primary` (vermelho Lar) e tons semânticos padrão.
- Protótipos específicos de uma área (ex: app interno do agro) devem trocar o primary pela paleta da área **apenas no tema daquele fluxo** — nunca sobrescrever globalmente.
- Um padrão de escopo recomendado:
  ```css
  .fluxo-agro {
    --rz-primary: var(--rz-agro-primary-dark);
    --rz-primary-dark: var(--rz-agro-primary-dark);
    /* ... */
  }
  ```

### 11.6. Componentes adicionados ao DS vivo (2026-04-23)

Além dos componentes base, a página `/design-system` passou a expor:

| Componente | Razor | Uso Lar |
|-----------|-------|---------|
| **AutoComplete** | `RadzenAutoComplete` | Busca incremental em listas grandes (clientes, produtos, contas contábeis). Compartilha spec de `TextBox_FormField`. |
| **RadioButtonList** | `RadzenRadioButtonList` | Seleção única, orientação vertical ou horizontal. Círculo `20×20 px`, dot interno `--rz-primary`. |
| **CheckBoxList** | `RadzenCheckBoxList` + `RadzenCheckBox TriState` | Seleção múltipla + estado tri-state pra "pai" de sub-itens. |
| **Password** | `RadzenPassword` | Campo mascarado com toggle de visibilidade (olho). |
| **Rating** | `RadzenRating` | Avaliação por estrelas — modos normal / readonly / disabled. Estrela preenchida `--rz-primary`. |
| **Tooltip** | `RadzenTooltip` + `TooltipService` | Dica contextual. Fundo `--rz-base-900`, texto branco, sombra `--rz-shadow-2`. Posições: top/bottom/left/right. |
| **DataGrid** | `RadzenDataGrid` | Tabela densa com sort, filtro, paginação. Linha selecionada: primary com alpha 16%. |
| **Ordenação/filtro (composição)** | custom — classes `.ds-sort-card` + `.ds-sort-item` | Menu suspenso de ordenar/filtrar em toolbars de lista. Item ativo em `--rz-primary`. |

As variações visuais extensas do Button (Primary/Default/Info/Success/Warning + seus Outlined em todos os estados Normal/Hover/Focused/Active/Disabled) já são cobertas pelas props `ButtonStyle` × `Variant` × `Size` do `RadzenButton`. Não é necessário criar novos componentes — só mostrar a matriz no DS vivo.

### 11.7. Página interativa

A **página viva do design system** está em `/design-system` (ou `/ds`) do aplicativo. Mostra logos, paletas, tipografia, espaçamento, sombras e componentes renderizados ao vivo — use ela como referência visual no dia-a-dia.

---

*Fim do spec. Versão gerada a partir do arquivo Figma em 22/04/2026. Extensão Lar em 23/04/2026.*
