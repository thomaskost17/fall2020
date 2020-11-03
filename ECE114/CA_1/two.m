%
% read in the data
%
fid = fopen('sample.bin','r');
data = fread(fid,'short');
fclose(fid);

%
% cut a smaller piece for analysis
%
a=data(20601:20800);
half_length=max(size(a))/2+1;

%
% find the dft for the a
%
tic
fa=dft(a);
dft_time=toc;
fprintf('Out dft implementation took %d sec\n', dft_time)

figure(1);
%
% plot on linear scale
%
subplot(2,1,1);
plot(fa)
title('frequency domain: k=0->N-1');

%
% don't show the redundant upper half
%
subplot(2,1,2);
fa=fa(1:half_length);
plot(fa);
axis([1,half_length,0.8*min(fa),1.2*max(fa)]);
title('frequency domain: k=0->N/2');

figure(2);
%
% use a log magnitude scale
%
subplot(2,1,1);
fa=20*log10(fa);
plot(fa);
axis([1,half_length,0.9*min(fa),1.1*max(fa)]);
title('frequency domain: log scale');

%
% compare to the fft
%
subplot(2,1,2);
sprintf('starting fft')
tic
fft_a=fft(a);
fft_time=toc;
fprintf('MATLAB''s fast fft implementation took %d sec\n', fft_time)

fa=20*log10(abs(fft_a));
sprintf('finished fft')
plot(fa(1:half_length));
axis([1,half_length,0.9*min(fa),1.1*max(fa)]);
title('frequency domain: using matlab fft');

