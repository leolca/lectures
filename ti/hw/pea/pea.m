% Especifique o caminho do arquivo FASTA previamente baixado.
fastaFile = 'NC_000023.11[67525372..67749277].fa';

% Abra o arquivo FASTA para leitura.
fileID = fopen(fastaFile, 'r');

% Descarte a primeira linha (cabeçalho).
fgetl(fileID);

% Inicialize uma célula para armazenar as sequências.
sequences = {};

% Leia as linhas subsequentes e armazene-as como sequências.
do 
  txtline = fgetl(fileID);
  if ischar(txtline) sequences{end+1} = txtline; else break; endif
until false

% Feche o arquivo.
fclose(fileID);

% Remova a primeira sequência da célula (que era a linha descartada).
wholesequence = strjoin(sequences, '');

% Novo comprimento desejado dos fragmentos de sequência
n = 5;

% Calcular o número total de fragmentos
numFragments = floor(length(wholesequence) / n);

sequences = {};
for i = 0:numFragments-1
    sequences{i+1} = wholesequence(i*n+1:(i+1)*n);
end

numSequences = length(sequences);

function H = entropia(p)
    p = p(p > 0);
    H = - sum (p.*log2(p));
endfunction

function H = entropiaDNA(s)
    n = length(s);
    pA = sum(s == 'A')/n;
    pT = sum(s == 'T')/n;
    pC = sum(s == 'C')/n;
    pG = sum(s == 'G')/n;
    H = entropia([pA pT pC pG]);
    %H = - pA*log2(pA) - pT*log2(pT) - pC*log2(pC) - pG*log2(pG);
end

% Calcule a entropia para cada sequência no arquivo FASTA.
entropies = zeros(numSequences, 1);

for i = 1:numSequences
    if length(sequences{i}) == n
      entropies(i) = entropiaDNA(sequences{i});
    else
      entropies(i) = NaN;
    end
end

nanIndices = isnan(entropies);  % Find indices of NaN values
entropies_WithoutNaN = entropies(!nanIndices);  % Remove NaN values using logical indexing
mean_entropy = mean(entropies_WithoutNaN);  % Compute the mean

% Defina um limiar para identificar regiões codificadoras com menor entropia.
limiar = 0.5; % Ajuste conforme necessário.

% Identifique as regiões codificadoras com menor entropia.
idcod = find (abs(entropies - mean_entropy) > limiar);

% Exiba os resultados.
plot (entropies); xlim ([0 length(entropies)]); hold on;
line ([0 length(entropies)], [mean_entropy mean_entropy], 'Color', 'r', 'LineStyle', '--', 'LineWidth', 2);
plot (idcod, entropies(idcod), 'kx');

disp('Regiões Codificadoras:');
disp(length(idcod));

% Inicialize um dicionário vazio para armazenar as contagens de cada tipo.
contagensPorTipo = containers.Map();

% Percorra as sequências para contabilizar as ocorrências de cada tipo.
for i = 1:numSequences
    sequence = sequences{i};
    
    % Conte o número de ocorrências de cada base.
    counts = [sum(sequence == 'A'), sum(sequence == 'T'), sum(sequence == 'C'), sum(sequence == 'G')];
    
    % Converta as contagens em uma string para representar o tipo.
    tipo = num2str(counts);
    
    % Verifique se o tipo já está no dicionário.
    if isKey(contagensPorTipo, tipo)
        % Se o tipo já existe, atualize a contagem.
        contagensPorTipo(tipo) = contagensPorTipo(tipo) + 1;
    else
        % Se o tipo é novo, adicione-o ao dicionário com contagem inicial igual a 1.
        contagensPorTipo(tipo) = 1;
    end
end

% Exiba as contagens por tipo.
disp('Contagens por Tipo:');
disp(contagensPorTipo);

% Extrair os tipos e as contagens do dicionário.
tipos = keys(contagensPorTipo);
contagens = cell2mat(values(contagensPorTipo));

% Criar um vetor para os índices dos tipos.
indices = 1:numel(tipos);

% Plotar o histograma.
figure;
loglog(indices, sort(contagens, "descend"));

% Rotular os eixos e adicionar título ao gráfico.
xlabel('Tipo');
ylabel('Contagem');
title('Frequencia de Ocorrência dos Tipos');

if numel (tipos) < 25,
% Definir os rótulos dos tipos no eixo x.
set(gca, 'XTick', indices);
set(gca, 'XTickLabel', tipos);

% Rotacionar os rótulos em 90 graus para melhor visualização.
xtickangle(90);
endif

