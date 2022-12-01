function [x] = stage4(A,b)
%STAGE 4 : To take input of matrix A and column vector b to give out
%solution x if it exists.
%   The function will only take in one valid matrix say 'A' and a column
%   vector 'b'. Using LU Factorisation method , first we obtain L,U
%   components or lower and upper traingular matrix and then the solution
%   vector 'x'.

% Made by Shivang Chaudhary.

%% Dimensional compatibility for Matrix and vector.
% Verifying the vector to be one dimensional and dimensional compatible - 
% - with matrix:-
[row_vect,col_vect] = size(b);
[row,col] = size(A);
% Verifying Matrix
if row==col
    disp("The matrix is valid.")
else
    error('The matrix entered is invalid!')
    return;
end
% Verifying vector
if row_vect == row && col_vect == 1
    disp("The vector is unidimensional.")
else 
    error("The vector entered is invalid!")
end

%% Checking if all elements of vector are real:-
[row_vect,col_vect] = size(b);
for i = 1:row_vect
    num = b(i,col_vect);
    tf = isreal(num);
    if tf == false
        error("The vector is invalid!")
    end
end

%% LU-Factorisation of the matrix entered. (Using "stage3")
[L,U] = stage3(A);
% Thus we obtain lower and upper triangular matrix and all the checks
% on the matrix are done.

%% Calculating determinants of each components.
% We simply calculate the determinant of these matrices by multiplying the
% elements in the main diagonal.
% Initialising variables.
determinant_upper = 1; % Variable for upper-triangular matrix.
determinant_lower = 1; % Variable for lower-triangular matrix.

for i = 1:row
    for j = 1:row
        if i ==j
            determinant_lower = L(i,j)*determinant_lower;
            determinant_upper = U(i,j)*determinant_upper;
        end
    end
end

% If either of the determinant is zero, there is no solution vector.
if determinant_upper == 0
    error("The solution vector does not exist since determinant of upper-triangular matrix is zero.")
end
if determinant_lower == 0
    error("The solution vector does not exist since determinant of lower-triangular matrix is zero.")
end

%% Finding the solution vector at last after all the initial process.
% Using the procedure where A = L*U, here since we know 'L' and 'U'. We now
% calculate 'y' using "L*y=b" and then finally 'x' using "U*x=y". If they
% are all dimensionally compatible.

% Since we use the initially made functions 'stage1' and 'stage2', all
% checks on the input vectors and matrices are already done to check
% dimensional compatibility.

% First calculating 'y' through forward substituion:-
y = stage1(L,b);

% Now using backward substituion , we calculate 'x':-
x = stage2(U,y);