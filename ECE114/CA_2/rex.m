all_rec=[];
T=2;
Fs=8e3;


%if your computer has a microphone, use this block
recObj = audiorecorder(Fs, 16, 1);
disp('Start speaking.')
recordblocking(recObj,T);
disp('End of Recording.');
rec = getaudiodata(recObj);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%if your computer does not have a microphone, use a smartphone or another
%computer to record your voice.  Save the audio file as my_voice.wav or
%my_voice.mp3 and save it to the the same matlab path as this file.  Then
%use this block:

%[rec, Fs]=audioread('my_voice.wav') %or my_voice.mp3;
%T=length(rec)/Fs;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=[1:numel(rec)]/Fs;
freq=abs((fft(rec)));
Y = freq(1:length(freq)/2+1);
f=[0:length(Y)-1]/T;

% Plot the waveform and spectrum.
figure()
subplot(2,1,1)
plot(t,rec,'')
title('Waveform')
xlabel('time (sec)')
ylabel('amplitude')
subplot(2,1,2)
plot(f,Y);
title('Spectrum')
xlabel('frequency (Hz)')
ylabel('power')

figure()
spectrogram(rec,100,[],[],Fs,'yaxis');
colormap autumn %you can choose your favorite color scheme ;)

