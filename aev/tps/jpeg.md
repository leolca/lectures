**Proposta de Trabalho com ImageMagick: Explorando Parâmetros de Compressão JPEG**

**Introdução:**
Este trabalho tem como objetivo explorar os efeitos da compressão JPEG utilizando a ferramenta ImageMagick. O aluno irá investigar como alterar os fatores de subamostragem de crominância e modificar as tabelas de quantização para observar o impacto na qualidade da imagem resultante.

**Objetivos:**

1. **Alteração dos Fatores de Subamostragem de Crominância:**

   - Utilizar o comando `convert` do ImageMagick para comprimir uma imagem JPEG.
   - Explorar os parâmetros de subamostragem de crominância, como `-sampling-factor`.
   - Avaliar como diferentes configurações afetam a qualidade da imagem comprimida.

2. **Modificação das Tabelas de Quantização:**

   - Criar tabelas de quantização em formato XML, representando diferentes configurações para luminância e crominância.
   - Utilizar o parâmetro `-define jpeg:quantization-table` para especificar a tabela de quantização desejada durante a compressão.
   - Investigar como a modificação das tabelas de quantização influencia a qualidade da imagem final.

3. **Avaliação de Resultados:**

   - Comprimir a mesma imagem utilizando diferentes combinações de subamostragem de crominância e tabelas de quantização.
   - Comparar visualmente as imagens resultantes e analisar a qualidade percebida.
   - Utilizar métricas objetivas, se possível, para quantificar as diferenças entre as compressões.

**Comandos Relevantes:**

- Para alterar os fatores de subamostragem de crominância:

  ```bash
  convert input.jpg -sampling-factor 4:2:0 output.jpg
  ```

- Para modificar as tabelas de quantização:

  ```bash
  convert input.jpg -define jpeg:quantization-table=path/to/quantization-table.xml output.jpg
  ```

**Formato do Arquivo XML com Tabela de Quantização:**

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE quantization-table [
     <!ELEMENT quantization-table (table)+>
     <!ELEMENT table (description, levels)>
     <!ELEMENT description (#PCDATA)>
     <!ELEMENT levels (#PCDATA)>
     <!ATTLIST table slot CDATA #REQUIRED>
     <!ATTLIST levels width CDATA #REQUIRED>
     <!ATTLIST levels height CDATA #REQUIRED>
     <!ATTLIST levels divisor CDATA #REQUIRED>
   ]>
   <quantization-table>
     <table slot="0">
       <description>Luminance Quantization Table</description>
       <levels width="8" height="8" divisor="1">
         16, 11, 10, 16, 24, 40, 51, 61,
         12, 12, 14, 19, 26, 58, 60, 55,
         14, 13, 16, 24, 40, 57, 69, 56,
         14, 17, 22, 29, 51, 87, 80, 62,
         18, 22, 37, 56, 68, 109, 103, 77,
         24, 35, 55, 64, 81, 104, 113, 92,
         49, 64, 78, 87, 103, 121, 120, 101,
         72, 92, 95, 98, 112, 100, 103, 99
       </levels>
     </table>
   
     <!-- Adicione mais tabelas conforme necessário para crominância -->
   </quantization-table>
   ```

Certifique-se de que o aluno compreenda como modificar os parâmetros do comando convert e como criar tabelas de quantização em XML. Encoraje a experimentação com diferentes configurações para observar os resultados variados de compressão JPEG.
