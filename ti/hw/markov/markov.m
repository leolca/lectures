% vamos utilizar a mesma sequencia de DNA utilizada na prática sobre PEA
fastaFile = '../pea/NC_000023.11[67525372..67749277].fa'; % arquivo FASTA

fileID = fopen(fastaFile, 'r');
fgetl(fileID); % remover a primeira linha (cabeçalho)
sequences = {};
txtline = fgetl(fileID);
while ischar(txtline)
    sequences{end+1} = txtline;
    txtline = fgetl(fileID);
end
fclose(fileID);

wholesequence = strjoin(sequences, '');

function [ngrams, ngram_counts] = count_ngrams (s, n)
% ngrams: list of n-grams
% ngram_counts: counts of n-grams
% s: input string
% n: n-gram size
  rs = [];
  for i = 0:n-1,
    ss = s(i+1:end-mod (length (s)-i, n));
    rs = [rs, reshape(ss, n, length (ss) / n)]; % makes each column a n-gram
  endfor
  [ngrams, I, J] = unique (rs', "rows");
  ngram_counts = histc (J, 1:length (ngrams));
endfunction

w = wholesequence;
G2gram = [[w(1:2:end-1)' w(2:2:end)']; [w(2:2:end-2)' w(3:2:end-1)']];
[Y, I, J] = unique (G2gram,"rows");
counts = histc (J, unique (J));
ngram_counts = counts;

%n = 2;
%[ngrams, ngram_counts] = count_ngrams (wholesequence, n);
C = reshape (ngram_counts, 4, 4)';
P = C ./ sum (C,2);
Q = P - eye (size (P));
Q1 = [Q(:,1:end-1) ones(size(Q,1),1)];
mu = [zeros(1,size(Q,2)-1) 1] * inv (Q1);

pkg load queueing
mu = dtmc(P);

function chain = generate_markov_chain(P, n, start_state)
    % Initialize the Markov chain realization with the first state (assumed to be state 1).
    chain = zeros(1, n);
    if nargin > 2,
      if !isindex (start_state, size (P,1)), error ("Start state out of range!"); endif;
      current_state = start_state;
    else
      current_state = randi (size (P,1));
    endif

    % Generate the Markov chain realization.
    for i = 1:n
        % Choose the next state based on the transition probabilities.
        next_state = find (rand() < cumsum (P(current_state, :)), 1);
        chain(i) = next_state;
        current_state = next_state;
    end
end


chain = generate_markov_chain (P, 1E6);

N = histc (chain, 1:size (P,1));
p = N / sum(N)
mu

function H = entropy (p,b)
  if (nargin == 0 || nargin > 2) print_usage (); endif;
  if any (p < 0) || any (p > 1) || !isvector (p) || abs (sum (p) - 1) > eps, error ('invalid input'); endif
  p = p(p > 0);
  H = - sum (p .* log2 (p));
  if nargin > 1, H *= log (2) / log (b); endif;
endfunction

function H = markov_entropy_rate (P)
  Q = P - eye (size (P));
  Q1 = [Q(:,1:end-1) ones(size(Q,1),1)];
  mu = [zeros(1,size(Q,2)-1) 1] * inv (Q1);
  H = 0;
  for i=1:size (P,1),
    H += mu(i) * entropy (P(i,:));
  endfor
endfunction

H = markov_entropy_rate (P)
