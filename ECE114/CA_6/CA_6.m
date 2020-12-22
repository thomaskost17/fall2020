%%
 %  File: CA_6.m
 % 
 %  Author: Thomas Kost
 %  
 %  Date: 30 November 2020
 %  
 %  @brief computer assignment for week 7
 %

 clc, close all, clear;
 
 %% Display image and FT
 
 ca6_image = imread("ca6_image.tiff");
 figure1 = figure;
 imagesc(ca6_image);
 colormap(gray);
 axis square;
 saveas(figure1, "original.jpg");
 
 FT_img = fft2(ca6_image);
 maximum = max(max(FT_img));
 c =6;
 scaled_FFT = (log10((abs(FT_img)/maximum)+0.000001)+c)*(255/c);
 figure2 = figure;
 imagesc(scaled_FFT)
 colormap(gray);
 axis square;
 saveas(figure2, "scaled_fft.jpg");
 
 %% modify coefficients and observe the effects (and more processing)
 mod128 = wipe(FT_img,[-128,127]);
 mod64 = wipe(FT_img,[-64,63]);
 mod32 = wipe(FT_img,[-32,31]);
 
 mod128_IM = ifft2(mod128);
 figure3 = figure;
 imagesc(abs(mod128_IM));
 colormap(gray);
 axis square;
 saveas(figure3, "remove128.jpg");
 
 mod64_IM = ifft2(mod64);
 figure4 = figure;
 imagesc(abs(mod64_IM));
 colormap(gray);
 axis square;
 saveas(figure4, "remove64.jpg");
  
 mod32_IM = ifft2(mod32);
 figure5 = figure;
 imagesc(abs(mod32_IM));
 colormap(gray);
 axis square;
 saveas(figure5, "remove32.jpg");
 
  
 psnr128 = psnr(abs(mod128_IM), double(ca6_image),255);
 psnr64  = psnr(abs(mod64_IM), double(ca6_image),255);
 psnr32  = psnr(abs(mod32_IM), double(ca6_image),255);
 
 function val = origin_shift_x(coordinate)
     val = coordinate -(512/2);
 end
 function val = origin_shift_y(coordinate)
     val = (512/2)-coordinate;
 end
 function result = wipe(image,bounding_coordinate)
 %top left corner
 x_bound = bounding_coordinate(1);
 y_bound = bounding_coordinate(2);
 s = size(image);
 result = image;
 for i = 1:s(1)
     for j = 1:s(2)
         if(origin_shift_x(i) < x_bound)
             result(i,j) = 0.0001;
         elseif(origin_shift_x(i)> -x_bound -1)
             result(i,j) = 0.0001;
         elseif(origin_shift_y(j) > y_bound)
             result(i,j) = 0.0001;
         elseif(origin_shift_y(j) < (-y_bound-1))
             result(i,j) = 0.0001;
         end
     end
 end
 
 end
