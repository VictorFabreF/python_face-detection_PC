function [r r0s] = rlgr(indices)
%
% Return number of bits needed to code indices
% using Adaptive Run-Length / Golomb-Rice coding
% [Malvar, DCC 2006]
%

L = 4;
U0 = 3;
D0 = 1;
U1 = 2;
D1 = 1;

k_P = 0;
k_RP = 2*L;
r = 0;
m = 0;
r0s = 0;
for n = 1:length(indices)
    if k_RP<0
        k_RP = 0;
    end
    if k_P<0
        k_P = 0;
    end
    if k_RP>32*L
        k_RP = 32*L;
    end
    if k_P>16*L
        k_P = 16*L;
    end
    k = floor(k_P/L);
    k_R = floor(k_RP/L);
    
    i = indices(n);
    if (i >= 0)
        u = 2*i;
    else
        u = 2*(-i)-1;
    end
    
    if (k==0)
        % "No run" mode
        r = r + gr(u,k_R); % code GR(u,k_R)
        
        % Adapt k_RP.
        p = floor(u/(2^k_R));
        if (p==0)
            k_RP = max([0,k_RP - 2]);
        else
            if (p>1)
                k_RP = min([32*L,k_RP + p - 1]);
            end
        end
        
        % Adapt k_P.
        if (u==0)
            k_P = k_P + U0;
        else
            k_P = max([0,k_P - D0]);
        end
        
        m = 0;
    else
        % "Run" mode
        if (u==0)
            % Continue run of 0s.
            m = m + 1;
            if (m==2^k)
                r = r + 1; % code '1'
                
                % Adapt k_P.
                k_P = k_P + U1;
                
                m = 0;
            end
        else
            % End run of 0s.
            r0s = r0s + 1 + k + gr(u-1,k_R);
            r = r + 1 + k + gr(u-1,k_R); % code 0 + bin(m,k) + GR(u-1,k_R)
            
            % Adapt k_RP.
            p = floor((u-1)/(2^k_R));
            if (p==0)
                k_RP = max([0,k_RP - 2]);
            else
                if (p>1)
                    k_RP = min([32*L,k_RP + p - 1]);
                end
            end

            % Adapt k_P.
            k_P = max([0,k_P - D1]);
            
            m = 0;
        end
    end
end
        
    
    
