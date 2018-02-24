% Weaver Image Reject Filter
clc;clear all;
costheta = 0:.01:1; theta = acos(costheta);%rad
figure;title('IRR (dB)  vs  Theta (rad)');
xlabel('Theta'); ylabel('Image Rejection Ratio');
hold on;
%case1----> epsilon = 0
IRR1 = IRR_fun(0.00,costheta);plot(theta,IRR1,'*m');
%case2----> epsilon = 0.25
IRR2 = IRR_fun(0.25,costheta);plot(theta,IRR2,'-g');
%case3----> epsilon = 0.5
IRR3 = IRR_fun(0.50,costheta);plot(theta,IRR3,'-r');
%case4----> epsilon = 0.75
IRR4 = IRR_fun(0.75,costheta);plot(theta,IRR4,'-c');
%case5----> epsilon = 1
IRR5 = IRR_fun(1.00,costheta);plot(theta,IRR5,'-b');
legend('eps 0','eps 0.25','eps 0.50','eps 0.75','eps 1');

function [IRR]= IRR_fun(epsilon,costheta)
A=1; temp = (1+(epsilon/A)); tempsq = temp^2;
IRR = 10.*log((tempsq - 2.*temp.*costheta +1)./(tempsq + 2.*temp.*costheta +1));
end



