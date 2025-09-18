A = [
    2 -1 -2; 
    -4 6 3; 
    -4 -2 8
    ];
b = [-2; 9; -5];
n = size(A,1);

L = eye(n);
U = A;

for k = 1:n-1
    for i = k+1:n
        L(i,k) = U(i,k)/U(k,k);
        U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n);
    end
end

% Solve Ly = b
y = zeros(n,1);
for i = 1:n
    y(i) = b(i) - L(i,1:i-1)*y(1:i-1);
end

% Solve Ux = y
x = zeros(n,1);
for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n)*x(i+1:n)) / U(i,i);
end

disp('L = '), disp(L)
disp('U = '), disp(U)
disp('Solution x = '), disp(x)
