---
title: "Codificação de Arquivos de Texto"
author: "Leonardo Araújo"
institute: UFSJ
lang: pt-BR
beamer: true
theme: Antibes
outertheme: tree
colortheme: dove
urlcolor: red
aspectratio: 169
output:
  beamer_presentation:
    pandoc_args: ["--pdf-engine=lualatex", "--output=encoding.pdf"]
header-includes: |
    \usepackage{amsmath}
    \DeclareMathOperator*{\argmax}{arg\,max}
    \DeclareMathOperator*{\argmin}{arg\,min}
    \usepackage{graphicx}
    \titlegraphic{\includegraphics[width=0.2\textwidth]{qrcode-encoding.png}}
    \newfontfamily\Symbola{Symbola}
    \setbeamercovered{transparent}
#classoption: "handout"
---

# Introdução à Codificação de Texto

- **Por que a codificação é importante:**
  - Formato legível para humanos: A codificação de texto permite que computadores armazenem e troquem textos de forma legível para humanos e processável por máquinas.\pause
  - Padronização: Codificações como UTF-8 fornecem um modo padrão para interpretar texto, evitando confusões causadas por codificações regionais ou proprietárias.\pause
  - Garantia de integridade dos dados entre sistemas diferentes.\pause
    - A codificação adequada preserva a precisão do texto ao compartilhá-lo, prevenindo corrupção de dados e garantindo a exibição consistente de caracteres.\pause

- **Visão Geral:**
  - Evolução de sistemas de codificação simples para complexos.

---

# Caractere vs. Glifo vs. Fonte

- **Caractere:** Unidade abstrata na codificação (ex.: 'A' no Unicode).
- **Glifo:** Forma visual de um caractere (como 'A' aparece em Arial vs. Times).
- **Fonte:** Coleção de glifos que compartilham um estilo de design.

![Glifo vs fonte.](glyph-vs-font.png){ width=80% }

---

# Jacquard

- Joseph Marie Jacquard em Lyon, 1801.

![Jacquard's loom.](loom.jpg){ width=38% }

---


# Escrita Noturna e Braille: Evolução na Codificação Tátil

- **Escrita Noturna:**
  - Inventor: Charles Barbier, 1815, para comunicação militar silenciosa.
  - Estrutura: Células de 12 pontos para sons fonéticos, complexa para uso prático.
\pause

- **Braille:**
  - Criador: Louis Braille, 1824 (primeira publicação em 1829), adaptado da Escrita Noturna.
  - Inovação: Célula de 6 pontos, mais simples e acessível para deficientes visuais.
  - Codificação Binária: Cada célula representa combinações binárias.
  - Adoção Universal: Braille tornou-se o padrão mundial de comunicação para deficientes visuais.
  - Expansão: Adaptado para várias línguas, matemática, música e outros.

---

![Escrita Noturna e Braille.](nightwritting-braille.png){ width=90% }

---

# Código Morse

- **História:** Desenvolvido por Samuel Morse e Alfred Vail nos anos 1840.
- **Mecanismo:** Usa pontos, traços e espaços para letras, números e pontuações.
- **Uso:** Principalmente telegrafia, mas também comunicação por rádio.

![Morse Code.](morse_code.png){ width=35% }

---

# Código Baudot e Código Murray

- **Código Baudot:**
  - Inventado por Émile Baudot, código de 5 bits para telegrafia.
  - Caracteres limitados, usava *shift* para números/letras.

- **Código Murray (ITA2):**
  - Extensão do Baudot, melhorado por Donald Murray.
  - Adicionou letras minúsculas e mais símbolos.

![Código ITA2 Baudot-Murray.](ita2code.png){ width=80% }

---

![Teletipo e fita perfurada.](teletype.jpg){ width=80% }

---

# EBCDIC (Extended Binary Coded Decimal Interchange Code)

- **História:** Desenvolvido pela IBM para computadores de grande porte.
- **Características:** Um dos primeiros sistemas de codificação de caracteres criados para processamento de dados em sistemas de larga escala.
  - Usado em sistemas legados (IBM 1401, 7090, System/360).
- EBCD, um subconjunto do EBCDIC.

---

![Cartão perfurado de 12 linhas/80 colunas e tabela EBCD.](punchcard_ebcdcode.jpg){ width=75% }

---

# ASCII e ASCII Estendido

- **ASCII (American Standard Code for Information Interchange):**
  - Código de 7 bits, 128 caracteres incluindo 33 códigos de controle não imprimíveis.
  - Padronizado em 1963 (ANSI).
  - Retrocompatibilidade: Apesar da idade, o ASCII continua amplamente utilizado hoje para garantir compatibilidade.
\pause

- **ASCII Estendido:**
  - Código de 8 bits, 256 caracteres, permitindo símbolos e caracteres adicionais.

---

![Tabela ASCII.](ascii.png){ width=70% }

---

| Caractere | Binário (Maiúscula) | Binário (Minúscula) | Caractere |
|-----------|---------------------|---------------------|-----------|
| A         | 01000001            | 01100001            | a         |
| B         | 01000010            | 01100010            | b         |
| C         | 01000011            | 01100011            | c         |
| ...       | ...                 | ...                 | ...       |
| Z         | 01011010            | 01111010            | z         |
| 1         | 00110001            | 00100001            | !         |
| 2         | 00110010            | 01000000            | "         |
| 3         | 00110011            | 00100011            | #         |
| 4         | 00110100            | 00100100            | $         |
| ...       | ...                 | ...                 | ...       |

---

# ASCII Art

\scriptsize
```
________________________
|.----------------------.|
||       ______         ||
||     .;;;;;;;;.       ||
||    /;;;;;;;;;;;\     ||
||   /;/`    `-;;;;; . .||
||   |;|__  __  \;;;|   ||
||.-.|;| e`/e`  |;;;|   ||
||   |;|  |     |;;;|'--||
||   |;|  '-    |;;;|   ||
||   |;;\ --'  /|;;;|   ||
||   |;;;;;---'\|;;;|   ||
||   |;;;;|     |;;;|   ||
||   |;;.-'     |;;;|   ||
||'--|/`        |;;;|--.||
||;;;;    .     ;;;;.\;;||
||;;;;;-.;_    /.-;;;;;;||
||;;;;;;;;;;;;;;;;;;;;;;||
'------------------------'
```
---

# BTC Genesis Block

![A mensagem embutida por Satoshi Nakamoto no primeiro bloco do Bitcoin (o Bloco Gênesis). A mensagem diz: "The Times 03/Jan/2009 Chancellor on brink of second bailout for banks," que era uma manchete do jornal The Times naquela data.](btcgenesis.png){ width=90% }

---

Mensagens ocultas em transações de Bitcoin são frequentemente inseridas usando o *opcode* `OP_RETURN`, que permite armazenar até 80 bytes de dados (normalmente texto em ASCII) na saída da transação.
Esse método é comumente usado para fins não financeiros, como inserir pequenos textos ou prova de dados.

---

# Base64

Base64 é um esquema de codificação de binário para texto que representa dados binários em um formato de string ASCII. Cada dígito Base64 representa exatamente 6 bits de dados, oferecendo uma forma de codificar dados binários como texto.

- Conjunto de caracteres: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 + /

\pause
Base64 é utilizado em:

- anexos de email,
- embutir dados binários em XML, JSON, ou HTML, e
- troca de dados em APIs.

---

![Alfabeto Base64 definido na RFC 4648.](base64.png){ width=60% }

---

Quando o comprimento da entrada não codificada não for um múltiplo de três, a saída codificada deve ter preenchimento adicionado para que seu comprimento seja um múltiplo de quatro.

![*Padding* no Base64.](base64padding.png)

---

\footnotesize

```
light w  len=7  bGlnaHQgdw==
w (ascii) 0111 0111
011101 110000 000000
  d       w

light wo  len=8  bGlnaHQgd28=
w (ascii) 0111 0111
o (ascii) 0110 1111
011101 110110 111100
   d      2      8

light wor  len=9  bGlnaHQgd29y
w (ascii) 0111 0111
o (ascii) 0110 1111
r (ascii) 0111 0010
011101 110110 111101 110010
   d      2      9      y
```

---

![Codificação da imagem do Tux em base64.](base64tux.png)

---

# Codificação de Chaves e Endereços no Bitcoin

- Todas as chaves e endereços são codificados usando métodos apropriados:
  - **Base58Check**: Para endereços legados e chaves privadas.
  - **Bech32**: Para endereços SegWit.

## Prefix Summary Table

| Tipo de Dado       | Prefixo      | Exemplo                |
|--------------------|--------------|------------------------|
| Endereço Legado    | `0x00`       | `1PMycacnJa...UAs`     |
| Endereço SegWit    | `bc1`        | `bc1qw508d6q...`       |
| Endereço Testnet   | `0x6F`       | `mhPo5P2RVu5...rEo`    |
| Chave Privada (WIF)| `0x80`       | `5J76fRXQYWk...U6q`    |

---

## Base58Check

- Conjunto de caracteres: 1 2 3 4 5 6 7 8 9 A B C D E F G H J K L M N P Q R S T U V W X Y Z a b c d e f g h i j k m n o p q r s t u v w x y z.
  - a-z, A-Z, e 0-9, com os caracteres visivelmente ambíguos (0, O, I, l) removidos.

\pause
### examplo
- 3 bytes: 0xFFFFFF
- Base 58: 2UzHL
- Passos:
  - 0xFFFFFF = 16 777 215
  - 16 777 215 mod 58 = 19 = L
  - 289 262 mod 58 = 16 = H
  - 4987 mod 58 = 57 = z
  - 85 mod 58 = 27 = U
  - 1 mod 58 = 1 = 2

---

## Bech32

- Conjunto de caracteres: q p z r y 9 x 8 g f 2 t v d w 0 s 3 j n 5 4 k h c e 6 m u a 7 l.
  - a-z, e 0-9, sem os seguintes caracteres: 1, b, i, o (b, i, o podem facilmente serem confundidos com 8, 1, 0, especialmente quando escritos à mão ou utilizando certas fontes).\pause
  - Caracteres geralmente confundidos (e.g. 5 vs S, 2 vs Z, p vs q vs g, etc.) possuem sempre uma diferença de um bit -- o código BCH é otimizado para detecção e correção de erros de um único bit.\pause
  - código BCH, GF(32), polinômio $g(x) = x^6 + 29x^5 + 22x^4 + 20x^3 + 21x^2 + 29x + 18$.\pause
  - Detecção de erros: até 4 erros em 89 caracteres. 
    - P2WPKH (Pay to Witness Public Key Hash): Esses endereços começam com `bc1q` e geralmente possuem 42 caracteres no mainnet (incluindo o prefixo `bc1`).
    - P2WSH (Pay to Witness Script Hash): Também começam com `bc1q`, mas são mais longos, tipicamente com 62 caracteres no mainnet, devido ao script hash ser maior.

\vspace{3em}

[Palestra - Pieter Wuille: New Address Type for SegWit Addresses](https://youtu.be/NqiN9VFE4CU)

[(Some of) the math behind Bech32 addresses](https://medium.com/@meshcollider/some-of-the-math-behind-bech32-addresses-cf03c7496285)

---

# ASCII Smuggling

O ASCII *smuggling* é uma técnica que utiliza caracteres Unicode de uma região específica conhecida como *Tags Unicode Block*. Esses caracteres são invisíveis nas interfaces de usuário, mas podem ser interpretados por modelos de linguagem grandes (LLMs). Ao converter caracteres ASCII em equivalentes de marca Unicode, os atacantes podem embutir instruções ou dados ocultos em um texto aparentemente inofensivo, fazendo parecer que não há informações adicionais, enquanto essas informações ainda são acionáveis por sistemas de IA. Esse método permite que atacantes manipulem respostas de IA, exfiltrem informações sensíveis ou alterem links clicáveis ou documentos, tudo sem o conhecimento do usuário.

---

![Ars Technica.](arstechnica.png){ width=70% }

---

![https://embracethered.com/blog/ascii-smuggler.html](easteregg.png){ width=50% }

---

# Padrões ISO/IEC

- **ISO/IEC 8859:**
  - Série de codificação de caracteres de 8 bits que suporta múltiplos idiomas.
  - ISO-8859-1 (Europa Ocidental), também conhecido como ISO Latin 1.
    - Os primeiros 128 caracteres são idênticos ao ASCII.
    - De `0x00` a `1F` e de `0x80` a `0x9F` (hex) usados para códigos de controle C0 e C1.
    - O conjunto C0 foi originalmente definido no ISO 646 (ASCII) (ex.: Início de Cabeçalho, Início de Texto, Fim de Texto, Fim de Transmissão, ...).
    - C1 são códigos de controle adicionais (ex.: Caractere de Preenchimento, Pré-ajuste de Alto Octeto, Quebra Permitida Aqui, Sem Quebra Aqui, ...).

- **ISO/IEC 10646:**
  - Conjunto universal de caracteres (UCS) para texto multilíngue.

---

![Página de Código ISO-8859-1.](iso-8859-1.png){ width=50% }

---

# Páginas de Código do Windows

- **Visão Geral:**
  - Múltiplas páginas de código para diferentes regiões e idiomas.
  - Utilizadas no Microsoft Windows nas décadas de 1980 e 1990.

- **Exemplos:**
  - CP1252 (Europa Ocidental), CP932 (Japão)
  - CP1252 foi o sucessor do CP850 (utilizado no DOS).

- **Problemas:**
  - Inconsistências entre diferentes sistemas.

---

## Transição de Codificação do Windows para Unicode

- **UCS-2 (Conjunto de Caracteres Unicode - 2 bytes):**
  - **Introdução:** Windows NT 3.1 (1993)
  - **Detalhes:** Codificação de largura fixa de 16 bits para os primeiros 65.536 caracteres Unicode, usada internamente para APIs do Windows.
\pause

- **UTF-16:**
  - **Adoção:** Windows 2000 (2000)
  - **Detalhes:** Uma extensão do UCS-2, acomodando todos os caracteres Unicode usando pares de substituição para caracteres além do Plano Multilíngue Básico (BMP).
    - Exemplo de Par de Substituição: O emoji \Symbola 😊 (Unicode U+1F60A) seria representado como: U+D83D (Substituto Alto) + U+DE0A (Substituto Baixo).
\pause

- **UTF-8:**
  - **Suporte Adicionado:** Windows 10 versão 1803 (Atualização de Abril de 2018)
  - **Detalhes:** Codificação de largura variável, compatível com ASCII. Tornou-se mais amplamente suportada para desenvolvedores com a introdução da propriedade `ActiveCodePage` no Windows 10 versão 1903 (Atualização de Maio de 2019).

---

# Unicode

  - Conjunto de caracteres universal que abrange todos os scripts, suportando mais de 143.000 caracteres.\pause
  - Atribui um número único (chamado de "ponto de código") a cada caractere, independentemente da plataforma, programa ou idioma.\pause
  - 1.112.064 pontos de código válidos dentro do espaço de códigos.\pause
  - A partir do Unicode 16.0, lançado em setembro de 2024, 299.056 (27%) desses pontos de código estão alocados, 155.063 (14%) têm caracteres atribuídos, 137.468 (12%) estão reservados para uso privado, 2.048 são usados para habilitar o mecanismo de substitutos, e 66 são designados como não-caracteres, deixando os restantes 815.056 (73%) não alocados.\pause
  - O Unicode possui diferentes formas de codificação: UTF-8, UTF-16 e UTF-32.

---

# UTF

- **UTF-8:**
  - Codificação de comprimento variável, compatível com ASCII, independente da ordem dos bytes.\pause
- **UTF-16:**
  - Codificação de comprimento variável (2 ou 4 bytes por caractere).
  - Caracteres latinos e os mais comumente usados CJK\footnote{Chinês, Japonês e Coreano.} são codificados em 2 bytes.\pause
- **UTF-32:**
  - Codificação de comprimento fixo (4 bytes por caractere).

---

![Estrutura do UTF-8.](utf8_structure.png)

---

# Domínio do UTF-8

![Conjunto de caracteres declarado para os 10 milhões de sites mais populares desde 2010.](utf-8_takes_over.png){ width=65% }

---

# Endianness (estremicidade)

- **Big Endian vs. Little Endian:**
  - Ordem dos bytes na representação da memória.
  - Impacta como os caracteres de múltiplos bytes são lidos.

![Endianness.](endianness.png){ width=80% }

---

![Big-Endian e Little-Endian.](bigvslittleendian.png){ width=55% }

---

- **Exemplo:**
  - UTF-16 e UTF-32 podem ser *big* ou *little endian*.
  - Byte Order Mark (BOM) para indicar *endianness* em uso.
  - O marcador BOM é o ponto de código `U+FEFF` (BOM, ZWNBSP\footnote{zero width no-break space}).
    - Big-endian (UTF-16BE): `FE FF`
    - Little-endian (UTF-16LE): `FF FE`
    - Big-endian (UTF-32BE): `00 00 FE FF`
    - Little-endian (UTF-32LE): `FF FE 00 00`
    - BOM no UTF-8: `EF BB BF`, funciona como uma assinatura para indicar que o arquivo está codificado em UTF-8 ao invés de especificar a ordem de bytes.

---

# Formatos de Arquivos Texto

- **.txt:** Geralmente ASCII ou UTF-8.
- **.csv:** Pode usar várias codificações; importante para troca de dados.
- **.json:** Notação de objetos JavaScript, para intercâmbio de dados.
- **.yml:** YAML não é linguagem de marcação, para serialização de dados.
- **.log:** Arquivos de log para registrar eventos, erros e atividades do sistema.
- **.ini:** Arquivos de inicialização para configurações.
- **.conf:** Arquivos de configuração, semelhantes aos .ini, usados por muitas aplicações.

---

# Markup Files

\footnotesize

- **Markdown:**
  - Linguagem de marcação leve para formatação de texto.
  - O Markdown em si não possui um mecanismo embutido para declarar a codificação no cabeçalho do arquivo.
\pause

- **TeX:**
  - Linguagem de composição tipográfica para tipografia de alta qualidade.
  - Codificação: Frequentemente UTF-8, mas pode ser sensível a caracteres não-ASCII sem a configuração adequada do preâmbulo.
  - `\usepackage[utf8]{inputenc}`

---

\footnotesize

- **XML (eXtensible Markup Language):**
  - Usado para armazenamento e transmissão de dados estruturados.
  - Codificação: Declarada na declaração XML, tipicamente UTF-8 ou UTF-16. A declaração de codificação é crucial para a análise correta.
  - `<?xml version="1.0" encoding="UTF-8"?>`
\pause

- **HTML (HyperText Markup Language):**
  - Linguagem de marcação padrão para documentos projetados para serem exibidos em um navegador da web.
  - Codificação: O padrão é frequentemente UTF-8, mas pode ser especificado com o atributo `charset` na tag `<meta>`. Codificação incorreta pode levar a texto embaralhado.
  - `<head><meta charset="UTF-8"></head>`
  - Cabeçalho Content-Type HTTP: `Content-Type: text/html; charset=UTF-8`

---

# Ferramentas do Linux para Codificação de Texto

- **iconv:** Converte texto de uma codificação para outra.
  - Exemplo: `iconv -f ISO-8859-1 -t UTF-8 input.txt > output.txt`
\pause
- **file:** Identifica tipos de arquivos e codificações.
  - Exemplo: `file -i example.txt`
\pause
- **uconv (do ICU):** Conversão mais avançada com suporte a Unicode.
  - Exemplo: `uconv -f UTF-8 -t UTF-16 input.txt -o output.txt`
\pause
- **dos2unix / unix2dos:** Converte entre quebras de linha do Windows e do Unix.
  - Exemplo: `dos2unix file.txt` (converte CRLF para LF)
  - Exemplo: `unix2dos file.txt` (converte LF para CRLF)

---

- **base64:**
  - Exemplo: Usado para codificar anexos de e-mail.
  - Uso: `echo "test" | base64` para codificar, `echo "dGVzdA==" | base64 -d` para decodificar.
\pause
- **base58:**
  - Exemplo: Útil para codificar endereços em criptomoedas (por exemplo, Bitcoin).
  - Uso: `echo "test" | base58` para codificar, `echo "E8f4pE5" | base58 -d` para decodificar.
\pause
- **base32:**
  - Exemplo: Usado para codificar endereços no protocolo Segregated Witness (SegWit) do Bitcoin.
  - Uso: `echo "test" | base32` para codificação, `echo "ORSXG5A=" | base32 -d` para decodificação.

---

- **recode:**
  - Função: Semelhante ao iconv, mas com capacidades adicionais.
  - Uso: `recode latin1..utf-8 file.txt`
\pause
- **xxd:**
  - Função: Cria um despejo hexadecimal de um arquivo binário, útil para entender dados em nível de byte.
  - Uso: `xxd -p file.bin` para hex simples, `xxd -r -p hex.txt` para reverter.
\pause
- **Casos de Uso:**
  - Migração de dados, limpeza e internacionalização.

---

# Extensões de Arquivo

- **Apenas um Nome:** As extensões não definem o conteúdo do arquivo.\pause
- **O Conteúdo Importa:** O tipo verdadeiro é determinado pelos dados internos.\pause
- **Cuidado:** Extensões enganosas podem ser arriscadas.\pause
- **Propósito:** Criadas para indicar o tipo de arquivo para facilitar o uso.

---

# Como o `file` Detecta a Codificação

## Números Mágicos / Assinaturas de Arquivo

  - O `file` procura sequências de bytes específicas no início dos arquivos que identificam de forma única os formatos ou tipos de arquivo.\pause
    - Para texto em UTF-8, procura o marcador BOM `EF BB BF`.
    - Para imagens JPEG, procura `FF D8 FF`.
    - Um arquivo PDF começa com `%PDF`.
    - Imagens PNG começam com os bytes `89 50 4E 47 0D 0A 1A 0A`.
    - Arquivos WAV começam com `52 49 46 46`.
    - Arquivos MP3 podem começar com `49 44 33`.

---

## Arquivos de Texto - Detecção de Codificação
  - **Heurísticas:** Quando os números mágicos não são conclusivos, o `file` usa heurísticas.\pause
    - **Análise de Caracteres:** Examina sequências de bytes em busca de padrões típicos de codificações específicas.\pause
    - **Análise de Frequência:** Observa a frequência e a distribuição de caracteres para adivinhar o idioma e, assim, a codificação.\pause
    - **Caracteres de Controle:** A presença ou ausência de certos caracteres de controle pode indicar a codificação.

---

## Banco de Dados MIME (Multipurpose Internet Mail Extension)
  - Mapeia o conteúdo do arquivo para tipos MIME e codificações.\pause
  - Localização: `/usr/share/file/magic.mgc` ou similar (banco de dados compilado).
    - O banco de dados `magic.mgc` é gerado a partir de um conjunto de arquivos de texto "mágicos" (por exemplo, /etc/magic) que definem as regras para reconhecer vários formatos de arquivo.
    - As regras consistem em:
      - Deslocamentos de byte
      - Padrões de byte
      - Expressões regulares
      - Descrições legíveis por humanos
    \pause
    - Exemplo:
      ```
      0   string  \x89PNG\r\n\x1a\n  PNG image data
      0   string  %PDF-              PDF document
      ```

\vspace{2ex}
[Lista de assinaturas de arquivos (Wikipedia)](https://en.wikipedia.org/wiki/List_of_file_signatures)

---

## Reconhecimento/Falsas Confusões

- **Ambiguidade:** Alguns arquivos podem ser interpretados como múltiplas codificações, especialmente se contiverem apenas caracteres ASCII.
  - Exemplo: Um arquivo com apenas ASCII pode ser relatado como `us-ascii`, mas pode ser `UTF-8` ou `ISO-8859-1`.
\pause

- **Informação Incompleta:** Arquivos curtos ou arquivos com um conjunto de caracteres limitado podem não fornecer dados suficientes para uma detecção precisa.
\pause

- **Sobreposição de Codificação:** Codificações que compartilham um subconjunto de caracteres (como ASCII em UTF-8) podem levar a confusões.
\pause

- **Binário em Texto:** Arquivos com dados binários incorporados podem confundir a ferramenta, fazendo-a pensar que é um arquivo binário em vez de texto com codificação.
\pause

- **Falsos Positivos:** Às vezes, o `file` pode errar na suposição devido a padrões que imitam outra codificação ou devido a um banco de dados mágico atualizado, mas não abrangente.

---

# Conclusão

- **Pontos Chave:**
  - **Jornada Através da Codificação:** Desde códigos históricos como Morse e Baudot até padrões modernos como UTF-8 e Unicode.
  - **Evolução:** A codificação de texto passou de sistemas simples para sistemas complexos.
  - **Solução Universal:** O Unicode fornece uma representação global de texto.
  - **Conceitos, Desafios, Soluções, Aplicações e Consciência:** Compreender esses aspectos é crucial.

- **Futuro:**
  - Evolução contínua dos padrões de codificação para acomodar novos scripts e símbolos.

![](globe.jpg){ width=20% }

