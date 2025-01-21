---
title: "Hifenização Automática"
author: "Leonardo Araujo"
institute: UFSJ
lang: pt-BR
beamer: true
theme: Antibes
outertheme: tree
colortheme: dove
urlcolor: red
aspectratio: 169
header-includes: |
    \usepackage[utf8]{inputenc}
    \usepackage{graphicx}
    \titlegraphic{\includegraphics[width=0.2\textwidth]{qrcode-hyphenation.png}}
    \setbeamercovered{transparent}
#classoption: "handout"
---

# Introdução

- Evolução histórica da hifenização:
  - Textos antigos: Sem marcas de hifenização.
  - Introdução da hifenização para gerenciar quebras de linha e evitar espaços excessivamente largos.\pause
- Importância:
  - Evitar grandes espaços em texto justificado.
  - Manter o fluxo estético.
  - Linhas curtas têm poucos pontos de quebra entre palavras - evitar rios e lagos.\pause
- Desvantagens:
  - Interromper o fluxo de leitura e a compreensão.
  - Pode levar à confusão.
  - Visualmente desagradável.

---

![Rios e Lagos.](riversnlakes.png){ width=75% }

---

![Rios, Lagos, Órfãos e Viúvas.](rlow.png){ width=60% }

---

# O papel do TeX
  - Hifenização automática desde 1977.
    - Donald Ervin Knuth (1977).
    - Franklin Mark Liang (1983).\pause
  - Usa `patgen` para a geração de regras.\pause
  - Hunspell (LibreOffice, Mozilla Firefox, Mozilla Thunderbird, Google Chrome, macOS, InDesign, memoQ, Opera, Affinity Publisher).\pause
  - [tex-hyphen - repositório central para todos os padrões de hifenização](https://github.com/hyphenation/tex-hyphen) - regras para 66 idiomas e outros recursos.\pause
  - Variáveis do TeX `\lefthyphenmin` e `\righthyphenmin`.

---

# Critérios para Hifenização

- Fonológico: Baseado na divisão de sílabas faladas.
  - Exemplo: "com-pu-ta-dor", mostrando a divisão silábica.\pause
- Morfológico (ou Etimológico): Focado nas partes da palavra que carregam significado (prefixos, raízes, sufixos).
  - Exemplo: "in-feliz", mostrando o prefixo e a raiz.\pause
- Ortográfico: Segue as convenções padrão de escrita.
  - Exemplo: "ad-vo-ga-do", as sequências consonantais constituiriam sílabas próprias, entretanto a ortografia impede que sejam separadas deixando uma sequência não permitida pela fonotática da língua ("a-d-vo-ga-do").\pause
- Semântico: Considera o contexto para evitar quebras ambíguas ou inadequadas.
  - Evitar "fede-ração" para evitar uma interpretação inadequada.\pause
- Estilo: A hifenização também pode ser uma questão de estilo, onde algumas divisões soam melhor ou são mais elegantes.
  - A separação "entres-safra" é preferível à "en-tressafra" ou "entressa-fra".

---

Esses critérios podem diferir ou ter pesos diferentes entre as línguas:

- Algumas línguas podem priorizar regras fonológicas sobre outras, como o espanhol e o português.
- Em línguas com compostos complexos, como o alemão, as considerações morfológicas podem ser mais proeminentes.
\pause

Esses critérios evoluíram ou mudaram com reformas linguísticas ou em contextos linguísticos específicos.

É complexo aplicar esses critérios, especialmente em contextos multilíngues ou com dialetos não padronizados.

---

# Regras de Hifenização no TeX

Algumas regras para o português:

\footnotesize
```
1b2l
1b2r
1ba
1be
1bi
1bo
1bu
1bá
1bâ
...
a3a
a3e
a3o
...
```

---

# Exemplo

```
   .   g   u   i   m   a   r   ã   e   s   .
     1   0   0   |   |   |   |   |   |   |    1gu
     1   0   4   0   |   |   |   |   |   |    1gu4i
     |   |   |   1   0   0   |   |   |   |    1ma
     |   |   |   |   |   1   0   0   |   |    1rã
max: 1   0   4   1   0   1   0   0   0   0
final: g   u   i - m   a - r   ã   e   s
```

---

# Regras de hifenização para o português

- [P.J. de Rezende. Portuguese hyphenation table for TeX (1987)](https://tug.org/TUGboat/tb08-2/tb18software.pdf)
- [P.J. de Rezende, J.J.D. Almeida. Hyphenation patterns for Portuguese (1987, 1994, 1996, 2015)](https://mirror.ctan.org/language/hyph-utf8/tex/generic/hyph-utf8/patterns/tex/hyph-pt.tex.)
- [L.C. Araujo, A. Benevides. Enhancing TeX hyphenation rules for Portuguese (2024)](https://tug.org/TUGboat/tb45-3/tb141araujo-pthyph.html)
- [L.C. Araujo, A. Benevides. Aperfeiçoando a Hifenização Automática em Português no TeX (2024)](https://www.linguamatica.com/index.php/linguamatica/article/view/435)

