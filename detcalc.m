function [detA] = detcalc(A)
%
% detcalc.m This function will calculate the determinant of a
% square matrix using recursion.
%
% Inputs: A is a (nxn) matrix
% Outputs: detA is the (1x1) determinant value
%
% Use: [detA] = detcalc(A);
%
% Coded by Andrew Crampton on 23/02/2021.

% Get the row and column dimensions of A
[rowA,colA] = size(A);

% Check to see if the row and column dimensions match
if rowA ~= colA
    error('The input matrix is not square.');
end

% Deal with the case when the input is a single number
if colA == 1
    detA = A;
end

% Calculate the base case of a 2x2 determinant
if colA == 2
    detA = A(1,1)*A(2,2) - A(1,2)*A(2,1);
end

% If the matrix is not 2x2, use recursion to calculate the determinant

if colA > 2

    % Prepare a zero vector to hold the expansion values
    temp = zeros(1,colA);
    
    % Expanding by the first row and looping across the columns in that row
    for j = 1:colA
        temp(j) = A(1,j) * (-1)^(1+j) * detcalc(A(2:end, [1:j-1, j+1:end]));
    end
    
    % Add up the expansion values to determine the final determinant value
    detA = sum(temp);
end



end

