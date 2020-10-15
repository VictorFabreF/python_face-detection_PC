function residuos = read_txt(filename)

    fileID = fopen(filename,'r');
    data = textscan(fileID, '%f');
    sz = length(data{1})/3;
    fclose(fileID);
    fileID = fopen(filename,'r');
    formatSpec = '%d %d %d';
    sizeA = [sz 3];
    residuos = fscanf(fileID,formatSpec, sizeA);
    fclose(fileID);
    %residuos = residuos';
end