function [] = my_dft(plot_name,data_label, exp, axie,fs, fig_name,activities)
% ==================== my_dft  ====================
	% Description: This function calculates the dft of all activities
    % of a experience by axis
    %       
	% Return: 
	%		>>> no value
    % 

figure(fig_name)
sgtitle(plot_name,'Interpreter','none');

hold on

for atv = 1 : length(data_label)
    tam = length(data_label);
    if mod(tam,2)
        subplot((length(data_label)+1)/2, 2, atv)
    else
        subplot((length(data_label))/2, 2, atv)
    end

    start = data_label(atv,2);
    finish = data_label(atv,3);

    X = fftshift(fft(exp(start:finish, axie)));
    X= abs(X(X>0));
    %N = length(exp(start:finish));
    N= length(X);
    if (mod(N,2)==0)
        f = -fs/2:fs/N:fs/2-fs/N;
    else 
        f = -fs/2 + fs/(2*N):fs/N:fs/2 - fs/(2*N);
    end
    plot(f, X)
    plot_name2 = sprintf("%s",activities{data_label(atv,1)});
    title(plot_name2)
    if atv== length(data_label) | atv== length(data_label)-1
        xlabel("frequency (HZ)");
    end
    
end

hold off


end