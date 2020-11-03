function []=zpfft(data,zpfactor)
length=max(size(data));
fft_length=length*zpfactor;
half_length=fft_length/2+1;
fa=20*log10(abs(fft(data,fft_length)));

plot(fa(1:half_length));
axis([1,half_length,0.9*min(fa),1.1*max(fa)]);
