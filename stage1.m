function [x] = stage1(L,b)
%STAGE 1 : SOLUTION VECTOR x FROM INPUT L AND b.
%   This function as supposed to will take one lower triangular matrix only
%   and one vector only to process and calculate for the resultant solution
%   vector x. No other false values will be accepted and only valid
%   matrices are inputted. 

% Made by Shivang Chaudhary

%% Checking if arrays are entered correctly for variables L and b. 
TF = isnumeric(L);
TF2 = isnumeric(b);
if TF && TF2 == 0
    disp("Please enter correct data types, i.e. only a matrix and a vector!")
    return
end

%% Checking to verify the size of matrix:-
[row,col] = size(L);

if (row==col)
    disp('The matrix is square')
else
    error('The operation is not possible since matrix is not square.');
end 

%% Verifying the vector to be one dimensional and dimensional compatible with matrix:-
[row_vect,col_vect] = size(b);
if row_vect == row && col_vect == 1
    disp("The vector is unidimensional.")
else 
    error('The vector entered is invalid!')
end

%% Checking if all the values inside the matrix are real numbers
for i = 1:row
    for j = 1:row
        number = L(i,j);
        disp(number);
        tf = isreal(number);
        if tf == false 
            disp("The lower traingular matrix is invalid!")
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

%% Checking if determinant is zero
% Checking if any diagonal value is zero or non-one.
for j = 1:row
    val_note = L(j,j);
    if val_note == 0
        disp("The determinant of given matrix is zero, please input valid L")
        return ;
    end
end

%% Checking for zeroes:-
% Based on the fact that every element at ij position where j>i should be
% zero.
for i = 1:row
    for j = 1:row
        element = L(i,j);
        if j>i && element~=0
            disp("L is not lower triangular matrix")
            return
        % Checking for IDENTITY Matrix.
        elseif i>j && element ==0
            if i==j && element==1
                disp("L is input as Identity matrix!")
            end
        end
    end
end
% After all the checks being done:-
disp("L is lower triangular matrix.")

%% Performing the final operation:-
disp("The solution vector through forward substitution is:-");
n = length(b);
x(1,1) = b(1)/L(1,1);
for i = 2:n
    x(i,1)=(b(i)-L(i,1:i-1)*x(1:i-1,1))./L(i,i);
end