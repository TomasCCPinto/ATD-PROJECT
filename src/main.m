%data(:,1) = activities(data(:,1))


%% Question 1
load_my_data;

% initial variables
axis_name        = ["Axis x" "Axis y" "Axis z"];
experiences_name = ["exp54" "exp55" "exp56" "exp57" "exp58" "exp59" "exp60" "exp61"];

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


y=3;
fs = 50;

for k = 59:59
    
    data_label = label(label(:,1) == k, 3:end);
    experience = sprintf("exp%d", k);
    for i = 1:3
        plot_name = sprintf("Experiencia %d %s",k,axis_name(i));
        my_dft(plot_name,data_label, eval(experience), i,fs,k*100+i,activities)
        
    end
end    

%% Question 3.3

acts = string(exp54_label(:,1));
%1/2/3 -> atividades dinamicas
acts_index = find(acts == "1" | acts == "2" | acts == "3");
table = zeros(1,length(acts_index))';
j = 1;
for i = acts_index'
    table(j) = my_steps("exp54",fs,i);
    j = j + 1;
end

["Activities Index","Steps Per Minute";acts_index,table]
mean(table)
std(table)



