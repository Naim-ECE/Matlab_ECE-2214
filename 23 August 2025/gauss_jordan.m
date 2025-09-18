clc; clear;

A = [
    2 -1 -2; 
    -4 6 3; 
    -4 -2 8
    ];
b = [-2; 9; -5];
n = size(A,1);

% Augmented matrix
Aug = [A b];

% Gauss-Jordan elimination
for k = 1:n
    % Make pivot 1
    Aug(k,:) = Aug(k,:) / Aug(k,k);
    
    % Make other rows zero in column k
    for i = 1:n
        if i ~= k
            factor = Aug(i,k);
            Aug(i,:) = Aug(i,:) - factor*Aug(k,:);
        end
    end
end

x = Aug(:,end);

disp('Gauss-Jordan Elimination:');
disp('Reduced row echelon form = '), disp(Aug)
disp('Solution x = '), disp(x)
