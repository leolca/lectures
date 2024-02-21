pkg load communications

function hcvec = hammingenco(binvec, G)
  n = size (G,1);
  nb = ceil (length (binvec) / n);
  binvec = [binvec(:); zeros(nb*n-length(binvec),1)]; % pad with zeros if necessary
  binvec = reshape (binvec, n, nb);
  hcvec = mod (G' * binvec, 2);
  hcvec = hcvec(:);
endfunction

function xd = hammingdeco(binvec, G, H)
  n = size (H,2);
  nb = length (binvec) / n;
  binvec = reshape (binvec, n, nb);
  s = mod (H * binvec, 2);
  for j = 1:nb,
     r = zeros (n, 1);
     if any(s(:,j)), 
       i = find (all( H == s(:,j)) == 1);
       r(i) = 1;
     endif
     binvec(:,j) = mod (binvec(:,j) + r, 2);
  endfor
  id = find (sum(G) == 1);
  R = zeros (size(H));
  for i=1:length(id),
    R(i,id(i)) = 1;
  endfor
  xd = R * binvec;
  xd = xd(:);
endfunction

function r = binnoise (p, l)
  r = rand (l,1) < p;
endfunction


M = 3; % M must be between 3 and 16.
[H, G] = hammgen (M);
x = [1 0 1 1 0 0 0 1 1 1 1 0 1];
lx = length(x);
xh = hammingenco(x, G);
xd = hammingdeco(xh, G, H);
xd = xd(1:lx)';
format = repmat("%d ", 1, length(x));
format = [format, "\n"];
printf (["sinal original:\t", format], x);
printf (["sinal decod.  :\t", format],xd);
[x; xd]


disp ('adicionando ruido');
r = binnoise (0.3, length(xh));
y = mod(xh + r, 2);
xd = hammingdeco(y, G, H);
xd = xd(1:lx)';
printf ('numero de bits alterados pelo ruído: %d\n', sum(r));
printf (["sinal original:\t", format], x);
printf (["sinal decod.  :\t", format],xd);
[x; xd]




CODE = encode (x, 7, 4, "hamming");
r = binnoise (0.1, length(CODE));
CODE = mod (CODE+r, 2);
MSG = decode (CODE, 7, 4, "hamming");
x
MSG'

