function [] = my_dft(data_label, exp, axie, fs, fig_name)


figure(fig_name)
hold on
for atv = 1 : length(data_label)
    subplot(length(data_label)/2, 2, atv)

    start = data_label(atv,2);
    finish = data_label(atv,3);

    X = fftshift(fft(exp(start:finish, axie)));

    N = length(exp(start:finish));
    if (mod(N,2)==0)
        f = -fs/2:fs/N:fs/2-fs/N;
    else 
        f = -fs/2 + fs/(2*N):fs/N:fs/2 - fs/(2*N);
    end
    plot(f, X)
end
hold off


end