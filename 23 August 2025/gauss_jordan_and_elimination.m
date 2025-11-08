clc;
clear;

% Example: Solve AX = B
A = [2 -1 1; 3 3 9; 3 3 5];
B = [2; -1; 4];

% Gauss Elimination Method
n = length(B);
Aug = [A B];
for i = 1:n-1
    for j = i+1:n
        f = Aug(j,i)/Aug(i,i);
        Aug(j,i:n+1) = Aug(j,i:n+1) - f*Aug(i,i:n+1);
    end
end
X = zeros(n,1);
X(n) = Aug(n,n+1)/Aug(n,n);
for i = n-1:-1:1
    X(i) = (Aug(i,n+1) - Aug(i,i+1:n)*X(i+1:n))/Aug(i,i);
end

% Gauss-Jordan Method
A1 = [A B];
[m,n1] = size(A1);
for j = 1:m
    A1(j,:) = A1(j,:)/A1(j,j);
    for i = 1:m
        if i ~= j
            A1(i,:) = A1(i,:) - A1(j,:)*A1(i,j);
        end
    end
end
X_gj = A1(:,end);

% LU Decomposition
[L,U] = lu(A);
% Solve Ly = B
y = L\B;
% Solve Ux = y
X_lu = U\y;

disp('Gauss-Elimination Solution:');
disp(X);
disp('Gauss-Jordan Solution:');
disp(X_gj);
disp('LU Decomposition Solution:');
disp(X_lu);
