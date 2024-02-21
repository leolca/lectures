pkg load communications

function nbits = saveBinaryVectorToFile(binaryVector, fileName)
    fid = fopen (fileName, 'wb');
    nbits = length(binaryVector);
    nbytes = ceil(nbits/8);
    binaryVector = [binaryVector zeros(1, nbytes*8-nbits)];
    binaryVector = reshape (binaryVector, nbytes, 8);
    fwrite (fid, uint8( bi2de (binaryVector) ), 'uint8');
    fclose (fid);
end

function loadedBinaryVector = loadBinaryVectorFromFile(fileName)
    fid = fopen (fileName, 'rb');
    bytes = fread (fid, Inf, 'uint8');
    loadedBinaryVector = de2bi (bytes);
    fclose (fid);
end

X = imread ('mario.pnm');
x = unique(X(:));
N = histc (X(:), x);
p = N./sum (N);

%%% huffman

hd = huffmandict (1:length(x), p');
[tf, s_idx] = ismember (X(:), x);
Xh = huffmanenco (s_idx, hd);
nbits = saveBinaryVectorToFile(Xh, "mario_huffman.bin");

r = loadBinaryVectorFromFile ("mario_huffman.bin");
r = r(:);
r = r(1:nbits);
r_idx = huffmandeco (r, hd);
r = x(r_idx);
Xr = reshape (r, size (X));
figure; subplot (1,2,1); imshow (uint8(X)); title ('original'); subplot (1,2,2); imshow (uint8(Xr)); title ('recuperada - huffman');


%%% shannon-fano

hd = shannonfanodict (1:length(x), p');
[tf, s_idx] = ismember (X(:), x);
Xh = shannonfanoenco (s_idx, hd);
nbits = saveBinaryVectorToFile(Xh, "mario_shannonfano.bin");

r = loadBinaryVectorFromFile ("mario_shannonfano.bin");
r = r(:);
r = r(1:nbits);
%r_idx = shannonfanodeco (r, hd);
r_idx = huffmandeco (r, hd); 	% a função shannonfanodeco não funciona ou é muito lenta
				% utilizando então a decodificação huffman
				% já que as funções de decodificação são equivalentes
r = x(r_idx);
Xr = reshape (r, size (X));
figure; subplot (1,2,1); imshow (uint8(X)); title ('original'); subplot (1,2,2); imshow (uint8(Xr)); title ('recuperada - shannon-fano');
