A = load("he.mat");
sig = A.val(1:400);

subplot(2,2,1)
plot(sig)
grid
title("Original")

sig_sampled = sig;     % (lazily) creates a copy
    for i = 0: 79
    
     sig_sampled(5*i+1)= sig(5*i+1);
     sig_sampled(5*i+2)= sig(5*i+1);
     sig_sampled(5*i+3)= sig(5*i+1);
     sig_sampled(5*i+4)= sig(5*i+1);
     sig_sampled(5*i+5)= sig(5*i+1);
 
    end

subplot(2,2,2)
plot(sig_sampled)
grid
title("Decimation in batches of 5")

sig_avg = sig;     % (lazily) creates a copy
    for i = 0: 79
    
     sig_avg(5*i+1)= (sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1))/5;
     sig_avg(5*i+2)= (sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1))/5;
     sig_avg(5*i+3)= (sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1))/5;
     sig_avg(5*i+4)= (sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1))/5;
     sig_avg(5*i+5)= (sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1)+sig(5*i+1))/5;
 
    end
subplot(2,2,3)
plot(sig_sampled)
grid
title("Averaging in batches of 5")

sig_max = sig;     % (lazily) creates a copy
    for i = 0: 79
        h= max(sig(5*i+1:5*i+5))
     sig_max(5*i+1)= h;
     sig_max(5*i+2)= h;
     sig_max(5*i+3)= h;
     sig_max(5*i+4)= h;
     sig_max(5*i+5)= h;
 
    end
subplot(2,2,4)
plot(sig_max)
grid
title("Max of batches of 5")