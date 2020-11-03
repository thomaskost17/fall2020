%%
 %  File: CA_2.m
 % 
 %  Author: Thomas Kost
 %  
 %  Date: 19 October 2020
 %  
 %  @brief running file for second computer assignment for ECE114
 %
 clc, clear all, close all;
 
 %% Pre-Emphasis Filters
 
 a = [0.8 0.5 -0.8];
 for n=1:length(a)
      figure;
      zplane([1 -a(n)],1);
      title(['a = ',num2str(a(n))]);
      saveas(n,"pre_emp_fil_" + a(n) +".jpg");
 end
 
 load_in;
 out=filter([1 -0.8],1,female_sentence);
 fprintf("Playing Unfiltered Sound:\n")
 soundsc(female_sentence,8000);
 pause(length(female_sentence)/8000);
 fprintf("Playing Filtered Sound:\n")
 soundsc(out,8000);
 pause(length(out)/8000);

 figure;
 spectrogram(female_sentence,100,[],[],8000,'yaxis');
 figure;
 spectrogram(out,100,[],[],8000,'yaxis');
 
 figure;
 hold on;
 zpfft(female_a,8000,10);
 out_a=filter([1 -0.8],1,female_a);
 zpfft(out_a,8000,10);
 legend("unfiltered", "filtered");
 saveas(6,"filtering.jpg");
 hold off;
%% Formant Frequency Identification
ffi = figure;
zpfft(male_a,8000,10);
saveas(ffi, "formants.jpg"); 

%% Pitch Period Estimation
figure;
plot(male_a);axis tight;
figure;
plot(female_a);axis tight;

rex;