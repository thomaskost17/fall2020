%%
 %  File: CA_1.m
 % 
 %  Author: Thomas Kost
 %  
 %  Date: 11 October 2020
 %  
 %  @brief Compute assignement for week 1. Covers problems covering basic frequency analysis
 %
 clear; clc; close all;

 %% Introduction exercise
 one;
 fig3 = figure; plot(a); title("Phenome /a/");
 fig4 = figure; plot(sh); title("Phenome /S/");
 
 saveas(fig3, "a.jpg");
 saveas(fig4, "sh.jpg");
 
 %% Part A: Implementing the Discrete Fourier Transform
 two;
 
 saveas(1, "spectrum.jpg");
 saveas(2, "fft_comp.jpg");
 
 %% Part B: The Effects of Oversampling
 three; 
  saveas(2, "fft_oversamp.jpg");

 
 %% Part C: Linear vs Circular Convolution
 
 x= [4, -1, 2];
 y_linear = conv(x,x);
 y_circular = cconv(x,x,5);
 y_fft = ifft(fft(x).*fft(x));
 