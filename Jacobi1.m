function [X] = Jacobi1(A,b,n)
%
% This function will calculate the solution to Ax=b using jacob iteration.
% Inputs: A =(n,n) coefficient matrix
%         b = (9n, 1) RHS Vector.
%         n = number of iterations.
%
% Output: X = matrix of solution estimates.
%
% Use: [X] = Jacobi1(A,b,n)
% Coded by Shivang Chaudhary 17/11/22

[rowA,colA]= size(A);

if rowA~=colA
    error('Matrix A is not square');
end

if rowA ~= length(b)
    error('The RHS vector is not compatible with A');
end

L = tril(A,-1);
U = triu(A,1);
D = A-L-U;

X = zeros(rowA,n);

% Jacobi iteration is x^(r+1) = inv(D) * [b - (L+U)x^(r)]

Di = inv(D);
LpU = L + U;

for r = 2:n
    X(:,r) = Di * (b - LpU*X(:,r-1));
end


end