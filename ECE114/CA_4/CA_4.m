%%
 %  File: CA_4.m
 % 
 %  Author: Thomas Kost
 %  
 %  Date: 03 November 2020
 %  
 %  @brief Computer assignment concerning linear predictive analysis of voice
 %
 clc, clear, close all;

 %% Spectrograms
 % load in signals
 load_in;
 
 % variables with default values
 NFFT = 256;
 Fs   = 8000;
 L    = 256;
 N_OL = 128;
 
 
 tone_spectrogram = figure;
 soundsc(tone, 8000);
 specgram(tone,NFFT, Fs, L, N_OL);
 title("tone spectrogram");
 saveas(tone_spectrogram, "tone_spectrogram.jpg");
 
 sweep_spectrogram = figure;
 soundsc(sweep, 8000);
 specgram(sweep, NFFT, Fs, L, N_OL);
 title("sweep spectrogram");
 saveas(sweep_spectrogram, "sweep_spectrogram.jpg");
 
 noise_spectrogram = figure;
 soundsc(noise, 8000);
 specgram(noise, NFFT, Fs, L, N_OL);
 title("noise spectrogram");
 saveas(noise_spectrogram, "noise_spectrogram.jpg");
 
 % Reevaluate paramaters
 NFFT = 512;
 L_values = [480, 240, 120, 60];
 N_OL_values = [360, 180, 90, 45];
 
 for n = 1:length(L_values)
     L = L_values(n);
     N_OL = N_OL_values(n);
     current_figure = figure;
     specgram(male_sentence, NFFT, Fs, L, N_OL);
     title([ 'L = ' num2str(L) ', N_{OL} = ' num2str(N_OL)]);
     saveas(current_figure,...
         ['male_sent_' num2str(L) '_' num2str(N_OL) '.jpg']);
 end
 

 %% Linear Predictive Order
 
 % clean up workspace
 clear, clc, close all;
 
 % load in necessary data
 load_in;
 
 % declare variables
 Fs = 8000;
 fft_factor = 8;
 
 male_a_fft = figure;
 zpfft(male_a,Fs,fft_factor);
 saveas(male_a_fft, "male_a_zpfft.jpg");
 p = [4,6,8,10,12];
 for n =1:length(p)
       pole_zero_map = figure;
       subplot(2,1,1);
       title(['P=' num2str(p(n)) 'mag'])
      a =lpc(male_a,p(n));
      [h,w]=freqz(1,a);
      plot(w,20*log10(abs(h)));
      subplot(2,1,2);
     title(['P=' num2str(p(n)) 'pole, zero']);

      pzmap(1,a);
     subplot(2,1,1);

     title(['P=' num2str(p(n)) 'mag'])

      saveas(pole_zero_map, ['pole_zero_p' num2str(p(n)) '.jpg']);
 end
 p = 100;
 a =lpc(male_a,p);
 mag_plot = figure; 
 [h,w]=freqz(1,a);
 plot(w,20*log10(abs(h)));
      title(['P=' num2str(p) 'mag'])

 saveas(mag_plot, ['mag_plot_p' num2str(p) '.jpg'])