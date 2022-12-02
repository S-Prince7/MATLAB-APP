function [X, count] = Jacobi2(A,b,tol)
%
% This function will calculate the solution to Ax=b using jacob iteration.
% Inputs: A =(n,n) coefficient matrix
%         b = (9n, 1) RHS Vector.
%         tol = (1,1) accurscy value
%
% Output: X = matrix of solution estimates.
%         count = Keep check of the amount of while loops executed.
%
% Use: [X] = Jacobi1(A,b,tol)
%
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

X = ones(rowA,1);

diff = 1;
count = 1;

% Jacobi iteration is x^(r+1) = inv(D) * [b - (L+U)x^(r)]

Di = inv(D);
LpU = L + U;

while max(abs(diff)) >= tol && count <= 1000
    count=count+1;
    X(:,count) = Di * (b - LpU*X(:,count-1));
    diff = X(:,count) - X(:,count-1);
end
disp(X);
disp(count);

end