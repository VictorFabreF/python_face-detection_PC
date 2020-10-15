function r = gr(u,k)
%
% Return number of bits needed to code indices
% using Golomb-Rice coding
% [Malvar, DCC 2006]
%

p = floor(u/(2^k));
if (p < 32)
    r = p + 1 + k; % code p 1s, a zero, and residual
else
    r = 64; % code 32 1s, and 32 bit int
end