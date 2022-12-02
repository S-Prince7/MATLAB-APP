% this file will construct a polynomial approximation
% to a set of discrete data and will evaluate the fit and
% plot the approximation error
%
% run this file by typing polyfit and following the onscreen instructions
%clear,
close all, clear, clc
disp(' The following functions can be used to define the y data values ')
disp('  ')
disp('    1.    y = sin(x) ')
disp('    2.    y = exp(-x^2)')
disp('    3.    y = 2x^3 - 3x^2 + 1')
disp(' ')
yfunc = input(' Choose an option 1, 2 or 3 from the list above :-  ');
disp('  ')
disp('  ')
noise = input(' Do you want random noise added to the data ?  1 = yes, 2 = no  :-  ');

if noise == 1
   disp(' ')
   alpha = input(' Specify noise level between 0 and 1 (ie 0.01)  :-  ');
 else
   alpha = 0;
end

disp(' ')

disp(' You must now define the range for your x values')
disp('  ')
xmin = input(' What is the minimum value for x ?  ');
xmax = input(' What is the maximum value for x ?  ');
num = input(' How many data points do you want to generate ?  ');

x = linspace(xmin,xmax,num)';

if yfunc == 1
  y = sin(x);
elseif yfunc == 2
  y = exp(-x.^2);
elseif yfunc == 3
  y = 2.*x.^3 - 3.*x.^2 +1;
end


if noise ==1
 y = y + alpha.*randn(size(y,1),1);
end

figure
plot(x,y,'r*')
xlabel('X'), ylabel('Y'), title('Data points')
hold on

disp(' ')
degree = input('  What degree of polynomial would you like ?   ');

for i = 1:degree + 1
  A(:,i) = x.^(i-1);
end

c = A\y;

nxvals = linspace(xmin,xmax, 10*num)';

for i = 1:degree + 1
  AA(:,i) = nxvals.^(i-1);
end
Y = AA*c;

plot(nxvals,Y,'b-'), title('DATA POINTS AND POLYNOMIAL APPROXIMATION')

if yfunc == 1
  ny = sin(nxvals);
elseif yfunc == 2
  ny = exp(-nxvals.^2);
elseif yfunc == 3
  ny = 2.*nxvals.^3 - 3.*nxvals.^2 +1;
end

figure
plot(nxvals,(ny-Y))
xlabel('X')
ylabel('APPROXIMATION ERROR')
title('APPROXIMATION ERRORS FOR REPRODUCING Y FUNCTION')



 


