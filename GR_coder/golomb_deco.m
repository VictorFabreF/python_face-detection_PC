function n_dec = golomb_deco (codeword, m)
%   Function n_rec = golomb_deco (codeword, m)
%   golomb_deco decodes the input golomb codeword using parameter m;
%   input: codeword is a single codeword, m is the coding parameter.
%   output: n_dec is the reconstructed symbol.
%   Example: n_rec = golomb_deco([0 1 0], 5)
%
% Author: Vishnu Muralidharan, 
%         University of Alabama in Huntsville
% Done for the project:
% 'Implementation of Golomb Encoder/Decoder to perform image coding'
% CPE 790: Data Compression, Fall 2014


code_len = length(codeword);

% Count the number of 1's followed by the first 0
q = 0;
for i = 1: code_len
    if codeword(i) == 1
        q = q + 1; %count the number of 1s
    else
        ptr = i;   % first 0
        break;
    end
end

if (m == 1)
    n_dec = q;   % special case for m = 1
else
    A = ceil(log2(m));
    B = floor(log2(m));
    
    % decoding the remainder
    bcode = codeword((ptr+1): (ptr + B));
    r = bi2de(bcode,'left-msb');
    if r < (2^A - m)
        ptr = ptr + B;
    else
        % r is the A-bit represtation of (r + (2^A - m))
        bcode = codeword((ptr+1): (ptr + A));
        r = bi2de(bcode,'left-msb') - (2^A - m);
        ptr = ptr + A;
    end
    n_dec = q * m + r; %computing the symbol from the decoded quotient and remainder
end

% if ~isequal(ptr, code_len)
%     error('Error: More than one codeword detected!');
% end