
%
% read in the data
%
fid = fopen('sample.bin','r');
data = fread(fid,'short');
fclose(fid);

%
% cut three smaller pieces for analysis
%
wash=data(19501:22400);
wa=data(20101:21100);
a=data(20601:20800);
sh=data(21300:22780);

%
% plot different time scales
%
figure(1);
subplot(2,1,1);
plot(data);
title('she had your dark suite in greasy wash water all year');
subplot(2,1,2);
plot(wash);
title('wash');

figure(2);
subplot(2,1,1);
plot(wa);
title('wa');
subplot(2,1,2);
plot(a);
title('a');

