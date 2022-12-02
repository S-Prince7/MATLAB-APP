clc, clear, close all

t = [0
     1
     2
     3
     4
     5
     6
     7
     8
     9
    10
    11
    12
    13
    14];

y = [13.9135
    15.9169
    18.0251
    19.3075
    19.7707
    20.4882
    20.2378
    19.2425
    18.0655
    16.2849
    13.9627
    11.3952
    7.8823
    4.6866
    -0.0273];

T = [ones(15,1) t t.^2];

c = T\y % this is cheating a bit by using Matlab's built-in solver

e = T * c - y;

disp('Least squares error is ...')     

norm(e)

nt = [1.5
      3.5
      7.25];

nT = [ones(3,1) nt nt.^2];

disp('predicted values for t = 1.5, 3.5 and 7.25 are ...')
predicted = nT*c

figure
hold on
plot(t, y, 'r*')
plot(nt, predicted, 'bsq')

ezplot('13.8408 + 2.5487*t - 0.2523*t^2', [min(t), max(t)])

