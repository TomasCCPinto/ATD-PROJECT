load_my_data;


data = label(label(:,1) == 54,3:end);


activities = ["WALK", "W\_USTR", "WALK\_DSTR", "SIT", "STAND","LAY", "STD\_ST", "ST\_STD", "ST\_LIE", "LIE\_SIT", "STD\_LIE", "LIE\_STD"];
%data(:,1)  = activities(data(:,1))

eixo = 1;

figure(1), 
hold all

old_finish = 0;
for k = 1:length(data)
    start  = data(k, 2);
    finish = data(k, 3);

    if abs(old_finish - start) > 5
        plot(old_finish+1:start-1, exp54_user27(old_finish+1:start-1, eixo), 'k')
    end
    
    plot(start:finish, exp54_user27(start:finish, eixo))
    exp54_user27(start, eixo)
    
    if mod(k, 2) ~= 0
        text(data(k,2), min(exp54_user27(:, eixo))*0.95, activities(data(k, 1)))
    else
        text(data(k,2), max(exp54_user27(:, eixo))*0.95, activities(data(k, 1)))
    end
    

    old_finish = finish;
end
axis([0 length(exp54_user27(:,eixo)) min(exp54_user27(:,eixo)) max(exp54_user27(:,eixo))])
title('Exp 54')
xlabel("Time (min)")
ylabel("Axix x")





