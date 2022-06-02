function P = my_power(signal, activities, sensors,activities_name) 
% ==================== my_power  ====================
	% Description: 
    %       
	% Return: 
	%		>>> Power table
    % 
	    x = evalin("base", signal);
	    labels = evalin("base", sprintf("%s_label", signal));
	    P = zeros(length(activities), length(sensors));
   
	    for act = activities
		    start = (labels(act, 2));
		    finish = (labels(act, 3));
		    for sensor = 1 : length(sensors)
    		     P(act, sensor) = double(sum(abs(fftshift(fft(x(start:finish, sensor))).^2)) / (finish-start));               
		    end
	    end
	   
		    figure();
		    x_labels = string(activities_name(labels(:,1)));
		    for s = 1 : length(sensors)
			subplot(4,1,s)

			stem(activities(activities < 13) , P(activities < 13,s),"filled","b");
			hold on;
            stem(activities(mod(activities,2)==0  ) , P(mod(activities,2)==0 ,s),"filled","g");
			stem(activities(activities >= 13) , P(activities >= 13,s),"filled","r");
            
			set(gca,"XTick",activities,"XTickLabel",x_labels);

			ylabel(sprintf("%s\n Power",sensors(s)));
			legend(["Static activities","Transition activities" ,"Dynamic activities"]);
			grid on;	
		    end
		     subplot(4,1,4);
		     Psum  = sum(P,2);
           
		     
		     stem(activities(activities < 13) , Psum(activities < 13),"filled","b");
		     hold on;
             stem(activities(mod(activities,2)==0  ) , Psum(mod(activities,2)==0),"filled","g");
		     stem(activities(activities >= 13) , Psum(activities >= 13),"filled","r");
		     set(gca,"XTick",activities,"XTickLabel",x_labels);
		    
		    ylabel("Sum");
		    legend(["Static activities","Transition activities" ,"Dynamic activities"]);
		    grid on;
	    
end