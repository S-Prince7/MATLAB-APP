function [L,U] = stage3(A)
%STAGE 3 : To factorise matrix A into components L and U which are lower
%and upper triangular matrices respectively.
%   The function will only take in one valid matrix say 'A' and use the
%   described method in the following code to factorise it in components L
%   and U step by step.

% Made by Shivang Chaudhary.

%% Checking if arrays are entered correctly for variables U and b. 
TF = isnumeric(A);
if TF == 0
    disp("Please enter correct data type, i.e. only a matrix!")
    return
end

%% Checking to verify the size of matrix:-
[row,col] = size(A);

if (row==col)
    disp('The matrix is square')
else
    error('The operation is not possible');
end 

%% Checking if all the values inside the matrix are real numbers
for i = 1:row
    for j = 1:row
        number = A(i,j);
        tf = isreal(number);
        if tf == false 
            disp("The matrix entered is invalid!")
            return
        end
    end
end

%% Checking for IDENTITY Matrix
z = 0;

for i = 1:row
    for j = 1:row
        num = A(i,j);
        if num == 1 && i==j
            z=z+1;
        end
        % Checking for IDENTITY Matrix.
        if i~=j && num==0 % Checking for values above and 
            % below the diagonal.
            z = z+1;
        end      
    end  
end

% Here, first 'if-statement' will record 1 if it is in the diagonal by
% incrementing 'z'. Similarly , second 'if-statement' will record number of
% zeroes in the matrix which are not in the diagonal , same by incrementing
% 'z'. Henceforth, if total of 'z' at the end of the loop is equal to
% number of elements in the matrix, the matrix from a totality perspective
% is Identity Matrix and if not then it isn't Identity Matrix.

if z == row*col
    disp("The matrix entered is Identity matrix")
    return
end

%% Checking if determinant is zero
% Based on the fact that if 2 rows are equal, the determinant will be zero
%  Here we make use of a variable 'val_check' which will keep track of the
%  number of times an element is repeated whenever it loops through rows
%  of matrix and finds a duplicate number. If the value recorded by it
%  reaches 3 which means that 2 rows are repeated, the function will
%  terminate with determinant zero as message output.
val_check = 0;
index=0;
for i = 1:row
    for j = 1 : row
        num = A (i,j); % Tracking every element. 

        index = index + 1; % Increasing index with every element tracked.
        if index > row % Starting to compare as soon as first row is -
            % - finished.

            num2 = A(i-1,j); % Element above current element.
            if num2 == num % Comparing elements.
                val_check = val_check +1; % Tracking number of same -
                % - elements in the same column.
                
                if val_check == row % If 2 rows of given 
                    % matrix are same:
                    disp("The determinant of given matrix is zero! " + ...
                        "Since two rows of the matrix are same.")
                    return
                end
            end
        end
    end
end
% The 'index' variable will keep track of elements being visited in
% consuquent rows, so when all elements in one row are visited , the
% 'if-statement' will compare every visiting element with the element above
% it and increase "val-check", so when 'val-check' equals the dimensions of
% matrix, we understand that two consecutive rows are exactly the same.

%% Performing the final operation:-
n = size(A);
% Making matrices of zeroes for L and U respectively.
L = zeros(n);
U = zeros(n);

% Making the diagoal vector 1 for Lower-triangular matrix
for i = 1:n
    L(i,i) = 1;
end

% The first row of 'U' is same as first row of input matrix 'A'
U(1,:) = A (1,:);
% Similarly, first column of 'L' will be same as first column of 'A'
% divided by first row of 'U'
L(:,1) = A(:,1)/U(1,1);

% Two loops for simultaneously computing elements for 'U' and 'L' at
% whatever positions required.
% Therefore, this loop will iterate through the rows of the matrices:
for i = 2:n
    % This loop will iterate through the columns of the matrices:
    % Hence, column by column the elements will be calculated in the
    % matrix.
    for j = i:n
        % For upper-traingular matrix
        U(i,j)= A(i,j) - L(i,1:i-1)*U(1:i-1,j);
    end
    % Here, the k will be the rows of the matrix and i will be the column
    % for the matrix , so that the elements can be calculated column by
    % column in each iteration and succession of the index of elements:
    for k = i+1:n
        % For lower-triangular matrix
        L(k,i) = (A(k,i) - L(k, 1:i-1)*U(1:i-1,i))/U(i,i);
    end
end

% Displaying the matrices:
disp("The upper triangular matrix:-")
disp(U)
disp("The lower triangular matrix:-")
disp(L)