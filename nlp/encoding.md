---
title: Text File Coding
author: Leonardo Araújo
institute: UFSJ
lang: en-US
beamer: true
theme: Antibes
outertheme: tree
colortheme: dove
urlcolor: red
aspectratio: 169
header-includes: |
    \usepackage{amsmath}
    \DeclareMathOperator*{\argmax}{arg\,max}
    \DeclareMathOperator*{\argmin}{arg\,min}
    \usepackage{graphicx}
    \titlegraphic{\includegraphics[width=0.2\textwidth]{qrcode-encoding.png}}
---

# Introduction to Text Encoding

- **Why Encoding Matters:**
  - Facilitates communication between computers and humans.
  - Ensures data integrity across different systems.

- **Overview:**
  - Evolution from simple to complex encoding systems.

---

# Morse Code

- **History:** Developed by Samuel F.B. Morse in the early 1840s.
- **Mechanism:** Uses dots, dashes, and spaces for letters, numbers, and punctuation.
- **Usage:** Primarily telegraphy, but also in radio communication.

![Morse Code](morse_code.png){ width=40% }

---

# Jacquard

- Joseph Marie Jacquard in Lyon in 1801.

![Jacquard's loom.](loom.jpg){ width=38% }

---

# Baudot and Murray Code

- **Baudot Code:**
  - Invented by Émile Baudot, 5-bit code for telegraphy.
  - Limited characters, used shift for numbers/letters.

- **Murray Code (ITA2):**
  - Extension of Baudot, improved by Donald Murray.
  - Added lower case, more symbols.

![ITA2 Baudot-Murray code](ita2code.png){ width=80% }

---

![Teletype and perforated strip.](teletype.jpg){ width=80% }

---

# EBCDIC (Extended Binary Coded Decimal Interchange Code)

- **History:** Developed by IBM for mainframe computers.
- **Characteristics:** Used in legacy systems.
- EBCD, a subset of EBCDIC.

---

![12-row/80-column IBM punched card and EBCD table.](punchcard_ebcdcode.jpg){ width=75% }

---

# ASCII and Extended ASCII

- **ASCII (American Standard Code for Information Interchange):**
  - 7-bit code, 128 characters including 33 non-printing control codes.
  - Standardized in 1963 (ANSI).
  - Backward Compatibility: Despite its age, ASCII remains widely used today for compatibility reasons.

- **Extended ASCII:**
  - 8-bit code, 256 characters, allowing for additional symbols and characters.

---

![ASCII Table](ascii.png){ width=75% }

---

| Character | Binary (Uppercase) | Binary (Lowercase) | Character |
|-----------|--------------------|--------------------|-----------|
| A         | 01000001           | 01100001           | a         |
| B         | 01000010           | 01100010           | b         |
| C         | 01000011           | 01100011           | c         |
| ...       | ...                | ...                | ...       |
| Z         | 01011010           | 01111010           | z         |
| 1         | 00110001           | 00100001           | !         |
| 2         | 00110010           | 01000000           | "         |
| 3         | 00110011           | 00100011           | #         |
| 4         | 00110100           | 00100100           | $         |
| ...       | ...                | ...                | ...       |

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

![The message embedded by Satoshi Nakamoto in Bitcoin's first block (the Genesis Block). The message reads, "The Times 03/Jan/2009 Chancellor on brink of second bailout for banks," which was a headline from The Times newspaper on that date.](btcgenesis.png){ width=90% }

---

# Base64

Base64 is a binary-to-text encoding scheme that represents binary data in an ASCII string format. Each Base64 digit represents exactly 6 bits of data, providing a way to encode binary data as text.

Base64 is used in:

- email attachments,
- embedding binary data in XML, JSON, or HTML, and
- data exchange in APIs.

---

![Encoding of Tux image into base64.](base64.png)

---

# ASCII Smuggling

ASCII smuggling is a technique that leverages Unicode characters, which are invisible in user interfaces but can be interpreted by large language models (LLMs), to embed hidden instructions or data within text. This method allows attackers to manipulate AI responses or exfiltrate sensitive information without the user's awareness, by embedding these hidden Unicode tags within clickable hyperlinks or documents shared in chats.

---

![Ars Technica](arstechnica.png){ width=70% }

---

![https://embracethered.com/blog/ascii-smuggler.html](easteregg.png){ width=50% }

---

# ISO/IEC Standards

- **ISO/IEC 8859:**
  - Series for 8-bit character encoding supporting multiple languages.
  - ISO-8859-1 (Western Europe), also known as ISO Latin 1. 
    - The first 128 characters are identical to ASCII.
    - 0x00 to 1F and 0x80 to 0x9F (hex) used for C0 and C1 control codes.
    - C0 set was originally defined in ISO 646 (ASCII) (e.g., Start of Heading, Start of Text, End of Text, End of Transmission, ...).
    - C1 are additional control codes (e.g., Padding Character, High Octet Preset, Break Permitted Here, No Break Here, ...).

- **ISO/IEC 10646:**
  - Universal character set (UCS) for multilingual text.

---

![ISO-8859-1 code page](iso-8859-1.png){ width=50% }

---

# Windows Code Pages

- **Overview:**
  - Multiple code pages for different regions and languages.

- **Examples:**
  - CP1252 (Western Europe), CP932 (Japan)

- **Issues:**
  - Inconsistencies across different systems.

---

# Unicode

- **Unicode:**
  - Universal character set covering all scripts, supporting over 143,000 characters.
  - It assigns a unique number (called a "code point") to each character, regardless of platform, program, or language.
  - 1.112.064 valid code points within the codespace.
  - As of Unicode 16.0, released in September 2024, 299,056 (27%) of these code points are allocated, 155,063 (14%) have been assigned characters, 137,468 (12%) are reserved for private use, 2,048 are used to enable the mechanism of surrogates, and 66 are designated as noncharacters, leaving the remaining 815,056 (73%) unallocated.
  - Unicode has different encoding forms: UTF-8, UTF-16, and UTF-32.

---

# UTF

- **UTF-8:**
  - Variable-length encoding, backward compatible with ASCII, byte-order independent. 
- **UTF-16:**
  - Variable-length encoding (2 or 4 bytes per character).
  - Latin and most commonly used CJK\footnote{Chinese, Japanese, and Korean.} characters are encoded in 2 bytes.
- **UTF-32**:
  - Fixed-length encoding (4 bytes per character).

---

![UTF-8 Structure](utf8_structure.png)

---

# UTF-8 takes over

![Declared character set for the 10 million most popular websites since 2010](utf-8_takes_over.png){ width=65% }

---

# Endianness

- **Big Endian vs. Little Endian:**
  - Byte order in memory representation.
  - Impacts how multi-byte characters are read.

![Endianness](endianness.png){ width=80% }

---

- **Example:**
  - UTF-16 and UTF-32 can be big or little endian.
  - Byte Order Mark (BOM) to indicate the endianness being used.
  - The BOM is the code point `U+FEFF` (BOM, ZWNBSP\footnote{zero width no-break space}).
    - Big-endian (UTF-16BE): `FE FF`
    - Little-endian (UTF-16LE): `FF FE`
    - Big-endian (UTF-32BE): `00 00 FE FF`
    - Little-endian (UTF-32LE): `FF FE 00 00`
    - BOM in UTF-8: `EF BB BF`, serves more as a signature to indicate that the file is encoded in UTF-8 rather than specifying byte order.

---

# Text File Formats

- **.txt:** Usually ASCII or UTF-8.
- **.csv:** Can use various encodings; important for data exchange.
- **.json:** UTF-8 by default, supports Unicode.
- **.log**: Log files for recording events, errors, and system activities.

---

# Markup Files

\footnotesize
- **TeX:**
  - **Usage:** Typesetting language for high-quality typography.
  - **Encoding:** Often UTF-8, but can be sensitive to non-ASCII characters without proper preamble setup.

- **XML (eXtensible Markup Language):**
  - **Purpose:** Used for structured data storage and transmission.
  - **Encoding:** Declared in XML declaration, typically UTF-8 or UTF-16. Encoding declaration is crucial for correct parsing.

- **HTML (HyperText Markup Language):**
  - **Usage:** Standard markup language for documents designed to be displayed in a web browser.
  - **Encoding:** Default is often UTF-8, but can be specified with the `charset` attribute in the `<meta>` tag. Incorrect encoding can lead to garbled text.

- **Markdown:**
  - **Purpose:** Lightweight markup language for formatting text.
  - **Encoding:** Generally UTF-8, supports rich text with simple syntax.

---

# Linux Tools for Text Encoding

- **iconv:** Converts text from one encoding to another.
  - Example: `iconv -f ISO-8859-1 -t UTF-8 input.txt > output.txt`
- **file:** Identifies file types and encodings.
  - Example: `file -i example.txt`
- **uconv:** More advanced conversion with Unicode support.
  - Example: `uconv -f UTF-8 -t UTF-16 input.txt -o output.txt`
- **dos2unix / unix2dos:** Converts between Windows and Unix line endings.
  - Example: `dos2unix file.txt` (converts CRLF to LF)
  - Example: `unix2dos file.txt` (converts LF to CRLF)

- **Use Cases:**
  - Data migration, cleaning, and internationalization.

---

# Conclusion

- **Key Points:**
  - Text encoding has evolved from simple to complex systems.
  - Unicode provides a universal solution for global text representation.

- **Future:**
  - Continued development in encoding standards to support new scripts and symbols.

