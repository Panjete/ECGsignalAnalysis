A= load('ecg.txt');
plot(A)

rd = 5;
fl = 21;
 
smtlb = sgolayfilt(A,rd,fl);

cmd + / for comment, cmd + t for uncomment
subplot(2,1,1)
plot(A)
axis([40000 42000 -3 2])
title('Original')
grid
 
subplot(2,1,2)
plot(smtlb)
axis([40000 42000 -3 2])
title('Filtered')
grid



 