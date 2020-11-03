%%
 %  File: CA_3.m
 % 
 %  Author: Thomas Kost
 %  
 %  Date: 26 October 2020
 %  
 %  @brief file to execute code for 3rd computer assignemnt of ECE114
 %
 close all;
 %% Short Time Energy Analysis
 one;
 soundsc(data, 8000);

 Fs = 8000;
 Nwn = 0.025*Fs;
 Nww = 0.003*Fs;
 Nwn = Nwn/2;
 q1 =figure;
Q1  = time_analysis(data,'rectwin',Nwn,1);
saveas(q1, "Q1.jpg");
q2 = figure;
Q2  = time_analysis(data,'rectwin',Nwn,2);
saveas(q2, "Q2.jpg");
q3 = figure;
Q3  = time_analysis(data,'rectwin',Nwn,3);
saveas(q3, "Q3.jpg");
qa= figure;
Qa  = time_analysis(a   ,'rectwin',Nwn,3);
title("/a/");
saveas(qa, "Qa.jpg");

qsh=figure;
Qsh = time_analysis(sh  ,'rectwin',Nwn,3);
title("/Sh/");
saveas(qsh, "Qsh.jpg");



Ra = xcorr(a,a);
Rsh = xcorr(sh,sh);
AMDFa = amdf(a);
AMDFsh = amdf(sh);
ra = figure;
plot(Ra);
title("R_a");
amdfa = figure;
plot(AMDFa);
title("AMDF_a");

rsh = figure;
plot(Rsh);
title("R_{sh}");

amdfsh = figure;
plot(AMDFsh);
title("AMDF_{sh}");

saveas(ra, "Ra.jpg");
saveas(rsh, "Rsh.jpg");
saveas(amdfa, "AMDFa.jpg");
saveas(amdfsh, "AMDFsh.jpg");

 %% The Effect of Window Size
 load_in;
 Nw = 140;
 figure;
 zpfft(male_a,8000,8);
 figure;
 zpfft(female_a,8000,8);
 figure;
 zpfft(female_a(1:Nw),8000,8);
 
 figure;
 zpfft(male_a(1:Nw),8000,8);
 

 
 