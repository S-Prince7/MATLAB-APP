function [x] = stage2(U,b)
%STAGE 2 : SOLUTION VECTOR x FROM INPUT U AND b.
%   This function as supposed to will take one upper triangular matrix only
%   and one vector only to process and calculate for the resultant solution
%   vector x. No other false values will be accepted and only valid
%   matrices are inputted. 

% Made by Shivang Chaudhary

%% Checking if arrays are entered correctly for variables U and b. 
TF = isnumeric(U);
TF2 = isnumeric(b);
if TF && TF2 == 0
    disp("Please enter correct data types, i.e. only a matrix and a vector!")
    return
end

%% Checking to verify the size of matrix:-
[row,col] = size(U);

if (row==col)
    disp('The matrix is square')
else
    error('The operation is not possible since matrix entered is not square.');
end 

%% Verifying the vector to be one dimensional and dimensional compatible with matrix:-
[row_vect,col_vect] = size(b);
if row_vect == row && col_vect == 1
    disp("The vector is unidimensional.")
else 
    error("The vector entered is invalid!")
end

%% Checking if all the values inside the matrix are real numbers
for i = 1:row
    for j = 1:row
        number = U(i,j);
        tf = isreal(number);
        if tf == false 
            disp("The upper traingular matrix is invalid!")
            return
        end
    end
end

%% Checking if all elements of vector are real:-
for i = 1:row_vect
    num = b(i,col_vect);
    tf = isreal(num);
    if tf == false
        disp("The vector is invalid!")
        return
    end
end

%% Checking for zeroes:-
% Based on the fact that every element at ij position where i>j should be
% zero.
for i = 1:row
    for j = 1:row
    element = U(i,j);
        if i>j && element~=0
            disp("U is not upper triangular matrix")
            return
        end
        % Checking if any diagonal element is zero.
        if i==j && element==0
            disp("Determinant of upper triangular matrix is zero.")
            return
        % Checking for IDENTITY Matrix.
        elseif j>i && element ==0
            if U(i,i) == 1
                disp("U is input as Identity matrix!")
            end
        end  
    end
end
% After all the checks being done:-
disp("U is upper triangular matrix.")

%% Performing the final operation:-
disp("The solution vector through backward substitution is:-")
n = length(b);
x(n,1) = b(n)/U(n,n);
for i = n-1:-1:1
    x(i,1)=(b(i)-U(i,i+1:n)*x(i+1:n,1))./U(i,i);
end