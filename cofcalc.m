function [cof_matrix] = cofcalc(A)
% cofcalc.m: This function will check that the matrix A is square.
% If A is square, the function will compute the cofactor matrix.
% If it is not square, the function will throw an error
%
%   [cof_matrix] = cofcalc(A)
%
% Coded by Andrew Crampton 16/02/2021

[rowA, colA] = size(A);

if (rowA == colA)
cof_matrix = zeros(rowA,colA);    
    
    for i = 1:rowA
        for j = 1:colA
            temp = A;
            temp(i,:) = [];
            temp(:,j) = [];
            cof_matrix(i,j) = (-1)^(i+j) * det(temp);
        end
    end
    
    
else
    error('The matrix A is not square.')
end



end

