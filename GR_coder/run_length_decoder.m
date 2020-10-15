function bit_stream = run_length_decoder(run)
    
    i = length(run);
    bit_stream = [];
    
    for pos_run = 1:i
        
        current_run = run(pos_run);
        while(current_run >= 0)
            if(current_run > 0)
                bit_stream = [bit_stream 0];
            else
                bit_stream = [bit_stream 1];
            end
            current_run = current_run - 1;
        end
        
        
    end

end