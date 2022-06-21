A = load("t1.mat");
sig1 = A.val;
plot(sig)
fs = 360;
N = length(sig);
duration_in_seconds = N/fs;
duration_in_minutes = duration_in_seconds/60;

A = load("t6.mat");
sig2 = A.val;

A = load("t6.mat");
sig = A.val;

A = load("t6.mat");
sig = A.val;

sigd= zeros(2*N,1);

for i = 1:N
    sigd(2*i)=sig(i);
    sigd(2*i +1) = sig(i);
end 
sig = sigd(1:N);

Q = zeros(30,1);
R = zeros(30,1);
S = zeros(30,1);

lp = designfilt('lowpassfir','FilterOrder', 1199, 'CutoffFrequency',100,'SampleRate',fs);
sig = filtfilt(lp,sig);

hp = designfilt('highpassfir','FilterOrder', 1199, 'CutoffFrequency',1,'SampleRate',fs);
sig = filtfilt(hp,sig);

beat_count = 0;
for k = 1 : length(sig)-1
    if(sig(k) > 160 && sig(k) > sig(k-1) && sig(k) > sig(k+1) && beat_count == 0)
        R(beat_count + 1) = k;
        beat_count = beat_count + 1;
    end
    if(sig(k) > 160 && sig(k) > sig(k-1) && sig(k) > sig(k+1) && k > R(beat_count) + 50)
        R(beat_count + 1) = k;
        beat_count = beat_count + 1;
    end
end

for k = 1 : beat_count
    ind = R(k);
    while (sig(ind + 1) < sig(ind) || sig(R(k)) < sig(ind) + 170)
        ind = ind + 1;
        if (ind >= length(sig) -1)
            break;
        end
    end
    S(k) = ind;
end

for k = 1 : beat_count
    ind = R(k);
    while (sig(ind - 1) < sig(ind) || sig(R(k)) < sig(ind) + 150) 
        ind = ind - 1;
        if (ind <= 1 ) 
            break;
        end
    end
    Q(k) = ind;
end

k = 0;
sum = 0;
while(S(k+1) ~= 0)
    sum = sum + S(k+1) - Q(k+1);
    k = k + 1;
end

RR_avg = (R(beat_count) - R(1))/(beat_count - 1);

QRS_avg = sum / (fs*k);
BPM_avg = (60*fs)/RR_avg;

plot(sig)
hold on;
plot(Q(1:beat_count),sig(Q(1:beat_count)),'rs','MarkerFaceColor','b')
plot(R(1:beat_count),sig(R(1:beat_count)),'rv','MarkerFaceColor','g')
plot(S(1:beat_count),sig(S(1:beat_count)),'rs','MarkerFaceColor','r')
legend('Smooth ECG signal','Q wave','R wave','S wave');
title('Detecting QRS waves');
xlabel('Samples');
ylabel('Voltage(mV)');


if (BPM_avg < 60)
    disp('Bradycardia');
elseif (BPM_avg > 100)
    disp('Tachycardia');
elseif (QRS_avg < 0.05 || QRS_avg > 0.10)
    disp('Abnormal Heartbeat');
else
    disp('Normal Heartbeat');
end