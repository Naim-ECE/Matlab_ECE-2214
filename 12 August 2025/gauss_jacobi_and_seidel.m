% Solve a linear system using Gauss-Jacobi and Gauss-Seidel methods
clc;
clear;

% Example system Ax = b
A = [4 -1 0; -1 4 -1; 0 -1 4];
b = [15; 10; 10];

tol = 1e-6;      % Convergence tolerance
maxIter = 100;   % Maximum number of iterations
n = length(b);   % Number of equations

%% Gauss-Jacobi Method
xJ = zeros(n,1); % Initial guess
for k = 1:maxIter
    x_old = xJ;
    for i = 1:n
        sum1 = 0;
        for j = 1:n
            if j ~= i
                sum1 = sum1 + A(i,j)*x_old(j);
            end
        end
        xJ(i) = (b(i) - sum1) / A(i,i);
    end
    if norm(xJ - x_old, inf) < tol
        break;
    end
end

%% Gauss-Seidel Method
xS = zeros(n,1); % Initial guess
for k = 1:maxIter
    x_old = xS;
    for i = 1:n
        sum1 = 0;
        for j = 1:n
            if j ~= i
                sum1 = sum1 + A(i,j)*xS(j); % Use updated values immediately
            end
        end
        xS(i) = (b(i) - sum1) / A(i,i);
    end
    if norm(xS - x_old, inf) < tol
        break;
    end
end

%% Display results
fprintf('Gauss-Jacobi Solution after %d iterations:\n', k);
disp(xJ);

fprintf('Gauss-Seidel Solution after %d iterations:\n', k);
disp(xS);
