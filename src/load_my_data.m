%  ==================== load_data  ====================
%  Description:
%  		This function load the data from a directory and store
%		it in diferent variables with the respective file name
%
%  Arguments:
% 		>>> dir_path (string): Path to the directory
%
%  Return: 
% 		>>> No values


function [] = load_my_data()


    file_list = dir('../RawData/');

    for file = file_list(3:end - 1)'

        path = sprintf("%s/%s", file.folder, file.name);
        data = importdata(path, " ");

		if strcmp(file.name, 'label.txt')
    		assignin("base", 'label', data);
		elseif strcmp(file.name, 'activity_labels.txt')
    		assignin("base", 'activities', data);
		else
        	assignin("base",file.name(5:16),data);
		end
    end

    path = sprintf("%s/%s", file_list(end).folder, file_list(end).name);
    data = importdata(path, " ");
    assignin("base", 'label', data);
end
