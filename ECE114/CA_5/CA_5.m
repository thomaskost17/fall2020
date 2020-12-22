%%
 %  File: CA_5.m
 % 
 %  Author: Thomas Kost
 %  
 %  Date: 23 November 2020
 %  
 %  @brief computer assignment for week 6
 %

 clear, clc, close all;
 
 %% Load and display image
 
 ca_5_image = imread("ca5_image.tiff");
 figure1 = figure;
 imagesc(ca_5_image);
 colormap(gray);
 saveas(figure1, "original.jpg");
 %% Generate 2D gaussian distribution matrix
 
 lambda = 10;
 [m,n] = meshgrid(-20:20);
  H = exp(-(m.^2 +n.^2)/lambda);
  s = sum(sum(H));
  H= H/s; %normalize
  
%% Convolve image with gaussian matrix
 g = conv2(ca_5_image, H);
 blurred_im = figure;
 imagesc(g); 
 colormap(gray);
 dims = size(ca_5_image);
 rect = [21,21, dims(1)-1, dims(2)-1];
 g_prime = imcrop(g, rect);
 cropped_im = figure;
 imagesc(g_prime);
 colormap(gray);
saveas(cropped_im, "blurred_10.jpg");
 
 %% PSNR Calculation
 
 diff = g_prime - cast(ca_5_image, 'like', g_prime);
 error = sum(sum(diff.^2));
 scaled_error = error /(dims(1)*dims(2));
 PSNR = 10*log10(255^2/(scaled_error));
 fprintf('PSNR = %f \n', PSNR);
 