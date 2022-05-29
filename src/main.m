%data(:,1) = activities(data(:,1))


%% Question 1
load_my_data;

% initial variables
axis_name        = ["Axis x" "Axis y" "Axis z"];
experiences_name = ["Exp54" "Exp55" "Exp56" "Exp57" "Exp58" "Exp59" "Exp60" "Exp61"];

%experiences(:,:,:) = [exp54_user27, exp55_user27, exp56_user28, exp57_user28, exp58_user29, exp59_user29, exp60_user30, exp61_user30];


%% Question 2

for k = 54:61
    experience = sprintf("exp%d", k);
    data_label = label(label(:,1) == k, 3:end);
    for i = 1:3
        my_plot(data_label, eval(experience), experiences_name(k-53), activities, i, axis_name(i), k)
    end
end


%% Question 3.1

data_label = label(label(:,1) == 61, 3:end);
y=3;
fs = 50;

my_dft(data_label, exp61, 3, 50, 1)



