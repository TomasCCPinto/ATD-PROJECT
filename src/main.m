
% initial variables
activities = ["WALK", "W\_USTR", "WALK\_DSTR", "SIT", "STAND","LAY", "STD\_ST", "ST\_STD", "ST\_LIE", "LIE\_SIT", "STD\_LIE", "LIE\_STD"];


%data(:,1) = activities(data(:,1))

%% Question 1
load_my_data;


%% uuestion 2
data_label = label(label(:,1) == 54,3:end);
my_plot(data_label, exp54_user27, "exp54_user27", activities)

