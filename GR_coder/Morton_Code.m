function mc = Morton_Code(V)

levels = bit_length(V);
bin_mc = char(zeros(size(V).*[1 levels]));
for k = 1:size(V,2)
	bin_mc(:,k:3:end) = dec2bin(V(:,k),levels);
end
mc = bin2dec(bin_mc);