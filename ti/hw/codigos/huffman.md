# Tarefa de Teoria da Informação: Codificação de Huffman e Shannon-Fano aplicadas a imagens PNM e diferença móvel

## Objetivo:
O objetivo desta tarefa é permitir que os alunos de graduação na disciplina de Teoria da Informação apliquem as técnicas de codificação de Huffman e Shannon-Fano a imagens PNM, assim como à codificação da diferença móvel dos pixels.

## Passos da tarefa:

1. Preparação:
   a) Faça o download de uma imagem PNM de sua escolha.
   b) Familiarize-se com as funções de codificação e decodificação de Huffman e Shannon-Fano disponíveis no GNU Octave/Matlab.

2. Codificação de Huffman aplicada à imagem PNM:
   a) Utilize a função de codificação de Huffman existente no GNU Octave/Matlab para codificar a imagem PNM.
   b) Armazene a sequência de bits comprimida em um arquivo.

3. Decodificação de Huffman aplicada à imagem PNM:
   a) Utilize a função de decodificação de Huffman existente no GNU Octave/Matlab para decodificar a sequência de bits comprimida e reconstruir a imagem PNM original.
   b) Verifique se a imagem reconstruída corresponde à imagem original.

4. Codificação de Shannon-Fano aplicada à diferença móvel dos pixels:
   a) Calcule a diferença móvel dos pixels da imagem original, obtendo uma nova sequência de valores representando a diferença entre os pixels adjacentes.
   b) Utilize a função de codificação de Shannon-Fano existente no GNU Octave/Matlab para codificar a sequência de diferenças móveis.
   c) Armazene a sequência de bits comprimida em um arquivo.

5. Decodificação de Shannon-Fano aplicada à diferença móvel dos pixels:
   a) Utilize a função de decodificação de Shannon-Fano existente no GNU Octave/Matlab para decodificar a sequência de bits comprimida e reconstruir a sequência de diferenças móveis original.
   b) Reaplique a sequência de diferenças móveis decodificada à imagem original para obter a imagem final reconstruída.
   c) Verifique se a imagem reconstruída corresponde à imagem original.

6. Avaliação:
   a) Execute a tarefa com diferentes imagens PNM e compare os tamanhos de arquivo resultantes das codificações de Huffman e Shannon-Fano aplicadas à imagem PNM e à diferença móvel dos pixels.
   b) Avalie as taxas de compressão alcançadas em cada caso e discuta as vantagens e desvantagens da codificação de Huffman e Shannon-Fano aplicadas a imagens, considerando os diferentes tipos de imagens utilizadas.

## Entrega:
Os alunos devem entregar o código fonte implementado em GNU Octave/Matlab, juntamente com um relatório descrevendo os passos realizados, os resultados obtidos e as análises feitas durante a tarefa.

## Observações:
- Os alunos podem buscar referências adicionais sobre a codificação de Huffman e a diferença móvel para aprimorar a implementação.
- Testem diferentes imagens e explorem outras técnicas de codificação e compressão para fins de comparação e discussão.
- Ao seguir essa tarefa, os alunos poderão praticar a aplicação das técnicas de codificação de Huffman e Shannon-Fano a imagens PNM, além de explorar a codificação da diferença móvel dos pixels. Eles também poderão comparar os resultados
