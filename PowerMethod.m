function [y] = PowerMethod(A,x,k)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[row,col] = size(A);
[row_vect, col_vect] = size(x);

if col == row_vect
    disp("Solution exists.")
    % Hoping for convergence:-
    for i = 1:k
        y = A*x
        x = y;
    end

else
    disp("Solution does not exist.")
    return;
end