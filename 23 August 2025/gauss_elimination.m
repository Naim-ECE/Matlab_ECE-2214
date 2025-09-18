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

% Forward elimination
for k = 1:n-1
    for i = k+1:n
        factor = Aug(i,k)/Aug(k,k);
        Aug(i,k:n+1) = Aug(i,k:n+1) - factor*Aug(k,k:n+1);
    end
end

% Backward substitution
x = zeros(n,1);
for i = n:-1:1
    x(i) = (Aug(i,end) - Aug(i,i+1:n)*x(i+1:n)) / Aug(i,i);
end

disp('Gauss Elimination:');
disp('Upper triangular matrix = '), disp(Aug(:,1:n))
disp('Solution x = '), disp(x)
