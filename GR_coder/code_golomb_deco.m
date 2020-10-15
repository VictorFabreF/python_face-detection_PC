function run = code_golomb_deco(code, m)
    
    run = [];
    i = length(code);
    k = 1;
    win_size = log2(m);
    dec_win = [];
    
    while(k <= i)
        
        if code(k) == 0
            dec_win = [dec_win code(k:k+win_size)];
            k = k + win_size + 1;
            run = [run golomb_deco(dec_win, m)];
            dec_win = [];
        else
            dec_win = [dec_win code(k)];
            k = k + 1;
        end
        
    end
    
    
end