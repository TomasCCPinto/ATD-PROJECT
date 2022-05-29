%data(:,1) = activities(data(:,1))


%% Question 1
load_my_data;

% initial variables
axis_name        = ["Axis x" "Axis y" "Axis z"];
experiences_name = ["Exp54" "Exp55" "Exp56" "Exp57" "Exp58" "Exp59" "Exp60" "Exp61"];

%experiences(:,:,:) = [exp54_user27, exp55_user27, exp56_user28, exp57_user28, exp58_user29, exp59_user29, exp60_user30, exp61_user30];


%% Question 2
format = "exp%d_label";
for k = 54:54
    experience = sprintf("exp%d", k);
    data_label = label(label(:,1) == k, 3:end);
    assignin("base",sprintf(format,k),data_label);
    for i = 1:3
        my_plot(data_label, eval(experience), experiences_name(k-53), activities, i, axis_name(i), k)
    end
end


%% Question 3.1

data_label = label(label(:,1) == 61, 3:end);
y=3;
fs = 50;

for k = 54:54
    experience = sprintf("exp%d", k);
    for i = 1:3
        my_dft(data_label, eval(experience), i, fs, i)
    end
end    

%% Question 3.3

acts = string(exp56_label(:,1));
%1/2/3 -> atividades dinamicas
acts_index = find(acts == "1" | acts == "2" | acts == "3");
table = zeros(1,length(acts_index))';
j = 1;
for i = acts_index'
    table(j) = my_steps("exp56",fs,i);
    j = j + 1;
end

["Activities Index","Steps Per Minute";acts_index,table]
mean(table)
std(table)