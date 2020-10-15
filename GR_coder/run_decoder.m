function decoded_run = run_decoder(code)
    method = code(1);
    initial = code(2);
    M_param_bin = code(3:6);
    M_param = 2^bi2de(M_param_bin, 'left-msb');
    run = code_golomb_deco(code(7:end), M_param);
    
    if method == 1
        decoded_run = [];
        flag = initial;
        for i = 1:length(run)
            if flag == 1
                decoded_run = [decoded_run ones(1, run(i))];
                flag = 0;
            else
                decoded_run = [decoded_run zeros(1, run(i))];
                flag = 1;
            end
        end
    else
        if initial == 1
            decoded_run = ~run_length_decoder(run);
        else
            decoded_run = run_length_decoder(run);
        end
    end

end



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