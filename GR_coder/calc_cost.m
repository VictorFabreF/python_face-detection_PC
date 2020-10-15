function rate = calc_cost(value_counts)
    m = 2.^(0:20);
    rate = zeros(length(m),2);
    rate(:,1) = m';
    pos = 1;
    [sz, ~] = size(value_counts);
    for i = m
        cost_total = 0;
        for j = 1:sz
            symbol = value_counts(j,1);
            code = golomb_enco(symbol, i);
            cost_symbol = length(code)*value_counts(j,2);
            cost_total = cost_total + cost_symbol;
        end
        rate(pos, 2) = cost_total;
        pos = pos + 1;
    end
end