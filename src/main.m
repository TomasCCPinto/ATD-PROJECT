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


%% Question 3

data_label = label(label(:,1) == 61, 3:end);

start = data_label(13,2);
finish = data_label(13,3);
y=2;
X = fftshift(fft(exp61(start:finish, y)));
m_X = abs(X);
%plot(1:length(X), X)

fs = 50;
N = length(exp61(start:finish));
if (mod(N,2)==0)
    f = -fs/2:fs/N:fs/2-fs/N;
else 
    f = -fs/2 + fs/(2*N):fs/N:fs/2 - fs/(2*N);
end

figure(2)
plot(f, m_X), hold on
title('|DFT| do sinal');
ylabel('Magnitude = |X|')
xlabel('f [Hz]')
axis tight
threshold = max(m_X) * 0.2;

% plot threshold in same figure
% hint, help yline
yline(threshold, 'r');
hold off

%% real
data_label = label(label(:,1) == 61, 3:end);
y=3;
fs = 50;

figure(10)
hold on
for atv = 1: length(data_label)
    subplot(length(data_label)/2, 2, atv)

    start = data_label(atv,2);
    finish = data_label(atv,3);
    X = fftshift(fft(exp61(start:finish, y)));

    N = length(exp61(start:finish));
    if (mod(N,2)==0)
        f = -fs/2:fs/N:fs/2-fs/N;
    else 
        f = -fs/2 + fs/(2*N):fs/N:fs/2 - fs/(2*N);
    end
    plot(f, X)
end
hold off



