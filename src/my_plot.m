function [] = my_plot(data_label, exp, exp_name, activities)


eixo = 1;

figure(1), 
hold all

old_finish = 0;
for k = 1:length(data_label)
    start  = data_label(k, 2);
    finish = data_label(k, 3);

    if abs(old_finish - start) > 5
        plot(old_finish+1:start-1, exp(old_finish+1:start-1, eixo), 'k')
    end
    
    plot(start:finish, exp(start:finish, eixo))
    
    if mod(k, 2) ~= 0
        text(data_label(k,2), min(exp(:, eixo))*0.95, activities(data_label(k, 1)))
    else
        text(data_label(k,2), max(exp(:, eixo))*0.95, activities(data_label(k, 1)))
    end
    
    old_finish = finish;
end
axis([0 length(exp(:,eixo)) min(exp(:,eixo)) max(exp(:,eixo))])
title(exp_name)
xlabel("Time (min)")
ylabel("Axix x")




end