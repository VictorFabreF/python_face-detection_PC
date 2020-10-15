function parents = read_parents(filename, sz)

    fileID = fopen(filename,'r');
    formatSpec = '%d %d';
    sizeA = [2 sz];
    residuos = fscanf(fileID,formatSpec, sizeA);
    fclose(fileID);
    residuos = residuos';
    residuos(:, 1) = residuos(:, 1) + 1;
    residuos(:, 2) = residuos(:, 2) + 1;
    parents = zeros(max(max(residuos)), 8);
    for i = 1:length(residuos)
        if residuos(i, 1) ~= 0
            [~, idx] = min(parents(residuos(i, 1),:));
            parents(residuos(i, 1),idx) = residuos(i, 2);
        end
    end
end