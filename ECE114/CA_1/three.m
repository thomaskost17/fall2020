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
length=max(size(a));
half_length=length/2+1;

figure(1);
%
% time data
%
subplot(2,1,1);
plot(a);
title('time domain');

%
% baseline fft
%
subplot(2,1,2);
zpfft(a,1);
title('freq domain');

figure(2);
%
% zero pad 2x
%
subplot(2,1,1);
zpfft(a,2);
title('freq domain: 2x');

%
% zero pad 8x
%
subplot(2,1,2);
zpfft(a,8);
title('freq domain: 8x');
