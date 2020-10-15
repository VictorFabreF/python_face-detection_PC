function entropy2 = calc_entropy(x)
    [~,~,ic] = unique(x);
    a_counts = accumarray(ic,1)/length(x);
    entropy2 = -a_counts.*log2(a_counts);
    entropy2 = sum(entropy2);
end