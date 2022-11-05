function [upper_triang_matrix] = rankCheck(A)
% Calculate upper-traingular matrix from input matrix

% Checking to verify the size of matrix:-
[row,col] = size(A);

if (row==col)
    disp('The matrix is square')
else
    error('The operation is not possible');
end 


%% Checking if determinant is zero
for j = 1:row
    val_note = A(j,j);
    if val_note == 0
        disp("The determinant of given matrix is zero")
        rank = 0;
        rank = num2str(rank);
        disp(rank);
        upper_triang_matrix = 0;
        return ;
    end
end


% Performing row operations on the matrx:- 

% Converting rows:-
for i = 1:row
        b = A (i,i);
        if b ~=1 && b ~=0
            rowi = A (i,:);
            rowi = rowi / b;
            A(i,:) = rowi;
        end
        % Before loop moves on to next row, convert values-below to-
        % - zero
        
         for j = i+1:col
                vali = A(j,i);
                A(j,i) = A(j,i) - A(i,i)*vali;
         end

end    

% Checking rank deficiency:-

rank = row;
array = [];

for i = 1:row
    final_Val = A(i,row);
    if final_Val == 0 
        array.add(1);
    end
end

if size(array) == 0
    rank = row;
elseif size(array)~=0
    rank = row-size(array);
end       
    
rank = num2str(rank);
disp("The rank of the matrix is: "+rank)
upper_triang_matrix = A;        
