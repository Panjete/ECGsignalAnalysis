A = load("he.mat");
sig = A.val(1:360);


subplot(2,2,1)
plot(sig)
title('Original')
hold on;
lp = designfilt('lowpassfir','FilterOrder', 20, 'CutoffFrequency',100,'SampleRate',fs);
sig2 = filtfilt(lp,sig);

subplot(2,2,2)
plot(sig2)
title('LPF')
hold on;

hp = designfilt('highpassfir','FilterOrder', 20, 'CutoffFrequency',.01,'SampleRate',fs);
sig3 = filtfilt(hp,sig);
subplot(2,2,3)
plot(sig3)
hold on;
title('HPF')


hp2 = designfilt('highpassfir','FilterOrder', 20, 'CutoffFrequency',.01,'SampleRate',fs);
sig4 = filtfilt(hp2,sig);
lp2 = designfilt('lowpassfir','FilterOrder', 20, 'CutoffFrequency',100,'SampleRate',fs);
sig5 = filtfilt(lp2,sig4);

subplot(2,2,4)
plot(sig5)
title('HPF+LPF')
grid

