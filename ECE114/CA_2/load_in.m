clear;
%
% read in the data
%
fid = fopen('sample.bin','r');
female_sentence = fread(fid,'short');
fclose(fid);
fid = fopen('msent.bin','r');
male_sentence = fread(fid,'short');
fclose(fid);
fid = fopen('music.bin','r');
music = fread(fid,'short');
fclose(fid);
fid = fopen('feesee.bin','r');
feesee = fread(fid,'short');
fclose(fid);

%
% cut two smaller pieces for analysis
%
female_a=female_sentence(20601:20920);
female_sentence=female_sentence(19500:31000);

fid = fopen('male_a.bin','r');
male_a = fread(fid,'short');
fclose(fid);
male_a = male_a(1001:1320);

tone=sin(1000*pi*[1:4000]/4000)';
sweep=sin(pi*[1:4000].*[1:4000]/8000)';
noise=randn(4000,1);

whos
