% part 1

files = dir ('../RawData/');

for file = files(3:end)'
	fpath = sprintf("%s/%s",file.folder,file.name);
    if not(strcmp("/home/joao_moreira/Desktop/MyProjects/ATD/projeto/RawData/labels.txt", fpath))
        data = importdata(fpath," ");
    end
end


figure, plot(1:length(data), data(:, 3))
