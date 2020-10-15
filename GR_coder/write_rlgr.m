function write_rlgr(fileName, NBP, K, len_signal, M_params, TGR, Final_Cod, flag)
    
    if flag == 1
        fileID = fopen(fileName, 'w+');
    else
        fileID = fopen(fileName, 'a+');
    end

    M_params = log2(M_params(NBP + 2:-1:1));
    
    fwrite(fileID, NBP, 'ubit4', 'ieee-be');
    %fwrite(fileID, K, 'ubit4', 'ieee-be');
    %fwrite(fileID, len_signal, 'ubit20', 'ieee-be');
    %fwrite(fileID, M_params, 'ubit4', 'ieee-be');
    
    for j = NBP + 2:-1:1
        fwrite(fileID, Final_Cod(j).Cod, 'ubit1', 'ieee-be');
        bits_tgr = 16 + K - (j - 1);
        %bin_tgr = de2bi(TGR(j), bits_tgr, 'left-msb');
        %fwrite(fileID, bin_tgr, 'ubit1', 'ieee-be');
    end
    fclose(fileID);
    

end    