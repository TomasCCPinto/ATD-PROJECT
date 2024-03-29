function [] = my_plot(data_label, exp, exp_name, activities, axle, axis_name, fig)
 % ==================== my_plot  ====================
	% Description: This function plots the full signal
    % of a experience by axis
    %
	% Arguments :
	%		>>> data_label
    %       >>> exp -> experience 
    %       >>> exp_name
    %       >>> activities -> cell with the activities
    %       >>> axis index
    %       >>> name of the axis
    %       >>> figure number
	% Return: 
	%		>>> none
    % 

figure(fig),
subplot(3,1,axle)
hold all

old_finish = 0;
for k = 1:length(data_label)
    start  = data_label(k, 2);
    finish = data_label(k, 3);

    if abs(old_finish - start) > 5
        plot(old_finish+1:start-1, exp(old_finish+1:start-1, axle), 'k')
    end
    
    plot(start:finish, exp(start:finish, axle))
    
    if mod(k, 2) ~= 0
        text(data_label(k,2), min(exp(:, axle))*0.95, activities(data_label(k, 1)))
    else
        text(data_label(k,2), max(exp(:, axle))*0.95, activities(data_label(k, 1)))
    end
    
    old_finish = finish;
end
%axis([0 length(exp(:, axle)) min(exp(:, axle)) max(exp(:, exle))])
title(exp_name)
xlabel("Time (min)")
ylabel(axis_name)




end