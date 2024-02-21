% Implementação das cifras: Cifra de César, Cifra da Espartilho e Cifra de Vigenère
pkg load statistics



% Cifra de César
function ciphertext = caesarCipher(plaintext, key, method)
    if nargin < 3, method = "ecryption"; end
    if strcmp(method, "decryption"), key = key*(-1); end
    plaintext = upper(plaintext);
    plaintext = regexprep(plaintext, '[^A-Z]', ''); % Remove non-alphabetic
    caesarEncrypt = @(text, key) char(mod(double(plaintext) - 65 + key, 26) + 65);
    ciphertext = caesarEncrypt(plaintext, key);
end

% Cifra da Espartilho (Scytale Cipher)
function ciphertext = scytaleCipher(plaintext, diameter)
    ciphertext = '';
    for i = 0:diameter-1
        shiftedPlaintext = circshift(plaintext, -i);
        downsampledText = downsample(shiftedPlaintext, diameter);
        ciphertext = [ciphertext, downsampledText];
    end
    ciphertext = ciphertext(1:length(plaintext));
end

function rtext = scytaleDecipher(ciphertext, diameter)
    rtext = '';
    for i = 0:diameter-1
        rtext(i*diameter+1:(i+1)*diameter) = downsample (circshift (ciphertext, -i), diameter-1);
    end
    rtext = rtext(1:length(ciphertext));
end


% Cifra de Vigenère
function ciphertext = vigenereCipher(plaintext, key, method)
    if nargin < 3, method = "ecryption"; end
    key = upper(key);
    key = regexprep(key, '[^A-Z]', ''); % Remove non-alphabetic
    key = double(key);
    if strcmp(method, "decryption"), key = key*(-1); end
    plaintext = upper(plaintext);
    plaintext = regexprep(plaintext, '[^A-Z]', ''); % Remove non-alphabetic
    key = repmat(key, 1, ceil(length(plaintext)/length(key)));
    key = key(1:length(plaintext));
    vigenereEncrypt = @(text, key) char(mod(double(plaintext) - 65 + key, 26) + 65);
    ciphertext = vigenereEncrypt(plaintext, key);
end


% Function to compute entropy
function H = textEntropy (text)
    text = upper(text);
    text = regexprep(text, '[^A-Z]', ''); % Remove non-alphabetic
    freqs = histc(double(text) - 64, 1:26);
    %idx = find (freqs > 0);
    %freqs = freqs(idx);
    freqs = freqs( freqs > 0 );
    p = freqs / length(text);
    H = - sum (p .* log2(p));
end

% Function to compute mutual information
function mutual_info = text_mutual_information(ciphertext, plaintext)
    % Restrict text to uppercase letters [A-Z]
    ciphertext = upper(ciphertext);
    ciphertext = regexprep(ciphertext, '[^A-Z]', ''); % Remove non-alphabetic
    plaintext = upper(plaintext);
    plaintext = regexprep(plaintext, '[^A-Z]', ''); % Remove non-alphabetic

    % Calculate the probability distribution of the ciphertext and plaintext
    %ciphertext_prob = histc(double(ciphertext), 65:90) / numel(ciphertext);
    %plaintext_prob = histc(double(plaintext), 65:90) / numel(plaintext);

    % Calculate the joint probability distribution of ciphertext and plaintext
    joint_prob = hist3([double(ciphertext(:)), double(plaintext(:))], {65:90, 65:90});
    joint_prob = joint_prob / numel(ciphertext);

    % Compute the mutual information
    %nonzero_idx = joint_prob > 0 & ciphertext_prob > 0 & plaintext_prob' > 0;
    %mutual_info = sum( sum(joint_prob(nonzero_idx) .* log2(joint_prob(nonzero_idx) ./ (ciphertext_prob(any(nonzero_idx))' * plaintext_prob(any(nonzero_idx,2))))) );
    mutual_info = 0;
    for i = 1:size(joint_prob,1),
    for j = 1:size(joint_prob,2),
        if joint_prob(i,j) > 0,
            mutual_info += joint_prob(i,j) .* log2( joint_prob(i,j) / ( sum(joint_prob(i,:)) * sum(joint_prob(:,j)) ) );
        end
    end
    end
end


plaintext = urlread ("https://www.gutenberg.org/cache/epub/151/pg151.txt");
plaintext = upper (plaintext);
plaintext = regexprep(plaintext, '[^A-Z]', ''); % Remove non-alphabetic
plaintext = plaintext(597:16019);
H_plaintext = textEntropy (plaintext);

% Caeser Cipher
caeser_ciphertext = caesarCipher(plaintext, 21);
file_id = fopen('/tmp/caesarCipherText.txt', 'w');
fprintf(file_id, "%s", caeser_ciphertext);
fclose(file_id);
H_caesercipher = textEntropy (caeser_ciphertext);
I_plaintext_caesercipher = text_mutual_information(caeser_ciphertext, plaintext);

% Scytale Cipher
scytale_ciphertext = scytaleCipher(plaintext, 5);
H_scytalecipher = textEntropy (scytale_ciphertext);
I_plaintext_scytalecipher = text_mutual_information(scytale_ciphertext, plaintext);

% Vigenère Cipher
vigenere_ciphertext = vigenereCipher(plaintext, "TELECOMUNICATIONSATDAWNWILLBETHEBESTCHOICEOFALLANDTHEREFORESHOULDALWAYSBEUSEDASITIS");
H_vigenerecipher = textEntropy (vigenere_ciphertext);
I_plaintext_vigenerecipher = text_mutual_information(vigenere_ciphertext, plaintext);


printf ("Plain text entropy: %.3f bits\n", H_plaintext);
printf ("Caesar Cipher text entropy: %.3f bits\n", H_caesercipher);
printf ("Mutual Information between plain text and Caesar Cipher text: %.3f bits\n", I_plaintext_caesercipher);
printf ("Scytale Cipher text entropy: %.3f bits\n", H_scytalecipher);
printf ("Mutual Information between plain text and Scytale Cipher text: %.3f bits\n", I_plaintext_scytalecipher);
printf ("Vigenère Cipher text entropy: %.3f bits\n", H_vigenerecipher);
printf ("Mutual Information between plain text and Vigenère Cipher text: %.3f bits\n", I_plaintext_vigenerecipher);




