%midterm problem 3
clear,clc,close all;
L2 = 5;
L1 = [0:0.05:12.5];
L3 = 17.5-L2-L1;
c = 360*100;
k = 1:3;
d1 = 3.4;
d2 =1;

A1 = pi*d1^2/4;
A3 =A1;
A2 = pi*d2^2/4;
% coefficeints = [
F_back = zeros(3,length(L1));
F_front = zeros(3,length(L3));
f_middle = zeros(3,1);

for i = k
 F_back(i,:) = k(i)*c./(2*L1);
 F_front(i,:) = ((2*k(i)-1)/4)*(c)./(L3);
 F_middle(i,:) = k(i)*c./(2*L2);
end
 F_helmholtz = c./(2*pi*(sqrt(L1*A1*(L2/A2))));
 
 nomogram =figure;
 hold on;
 plot(L1,F_helmholtz);
 plot(L1, F_back,'--');
 plot(L1,F_front);
 ylim([0 8000]);
 plot(L1,F_middle*(ones(1,length(L1))), '-.');
 legend("F_{helmholtz}", "F1_{back}","F2_{back}","F3_{back}", ...
     "F1_{front}", "F2_{front}", "F3_{front}", "F1_{middle}",...
     "F2_{middle}", "F3_{middle}");
 title("Nomogram");
  xlabel("L1");
 ylabel("frequency");
 hold off;
 saveas(nomogram, "nomogram.jpg");
 
 
 freqs = [F_back;
           F_front;
           F_helmholtz;
           F_middle*ones(1,length(L1))];
 formants = sort(freqs,1);
     
 
 
 
 
%midterm problem 3
L2 = 5;
L1 = [0:0.05:12.5];
L3 = 17.5-L2-L1;
c = 360*100;
k = 1:3;
d1 = 3.4;
d2 =2.4;

A1 = pi*d1^2/4;
A3 =A1;
A2 = pi*d2^2/4;
% coefficeints = [
F_back = zeros(3,length(L1));
F_front = zeros(3,length(L3));
f_middle = zeros(3,1);

for i = k
 F_back(i,:) = k(i)*c./(2*L1);
 F_front(i,:) = ((2*k(i)-1)/4)*(c)./(L3);
 F_middle(i,:) = k(i)*c./(2*L2);
end
 F_helmholtz = c./(2*pi*(sqrt(L1*A1*(L2/A2))));
 
 nomogram =figure;
 hold on;
 plot(L1,F_helmholtz);
 plot(L1, F_back,'--');
 plot(L1,F_front);
 ylim([0 8000]);
 plot(L1,F_middle*(ones(1,length(L1))), '-.');
 legend("F_{helmholtz}", "F1_{back}","F2_{back}","F3_{back}", ...
     "F1_{front}", "F2_{front}", "F3_{front}", "F1_{middle}",...
     "F2_{middle}", "F3_{middle}");
 title("Nomogram D2=2.4");
 xlabel("L1");
 ylabel("frequency");
 hold off;
 saveas(nomogram, "nomogram_2.jpg");
 
  
 freqs = [F_back;
           F_front;
           F_helmholtz;
           F_middle*ones(1,length(L1))];
 formants = sort(freqs,1);
     
 