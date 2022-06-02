function steps_per_minute = my_steps(exp,fs,act)
    % ==================== my_steps  ====================
	% Description: This function calculates the number of steps per minute
    % of a dinamic activity.
    %
	% Arguments :
	%		>>> exp (string): e.g "exp54"
    %       >>> fs (double) : Sampling Frequency 
    %       >>> act (double) : dinamic activity
	% Return: 
	%		>>> steps_per_minute (double) : steps_per_minute of the act
    % 

    
    % Getting Workspace Variables
    
    data_name = exp;
    label_name = sprintf("%s_label",exp);
    signal = evalin('base', data_name);
    label = num2cell(evalin('base',label_name));
    times = [[label{:,2}]',[label{:,3}]'];
    % Resolution in frequency
    N = length(signal(times(act,1):times(act,2),1));
    
    fo = fs/N;
    
    if mod(N,2) == 0
        n = -N/2: N/2 - 1;
    else
        n = -fix(N/2): fix(N/2);
    end
    f = n * fo;
    
    % DFT calculation
    dft = fftshift(fft(detrend(signal(times(act,1):times(act,2)))));
    % Getting most relevant frequency
    max_value = max(abs(dft));
    i = abs(dft) == max_value;
    max_freq = f(i);
    max_freq =  max_freq(max_freq > 0);
    % Steps per Minute
    steps_per_minute = 60 * max_freq;
end