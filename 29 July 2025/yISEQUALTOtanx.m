clc; clear;
format long;

% Given data points
x = [0.1 0.15 0.2 0.25 0.3];       % in radians
y = tan(x);                % corresponding tan(x)

n = length(x);
h = x(2) - x(1);           % Equal spacing

% Build forward difference table
diff_table = zeros(n, n);
diff_table(:,1) = y';

for j = 2:n
    for i = 1:n-j+1
        diff_table(i,j) = diff_table(i+1,j-1) - diff_table(i,j-1);
    end
end

% Show table
disp('Forward Difference Table:')
disp(diff_table)

% Input: point to interpolate
xp = 0.15;                        % target x
s_val = (xp - x(1)) / h;          % s = (x - x0)/h

% Build Newton's Forward Polynomial
syms s_sym
term = 1;
symbolic_eq = y(1);               % y0 is the first term

for i = 1:n-1
    term = term * (s_sym - (i - 1)) / i;
    symbolic_eq = symbolic_eq + term * diff_table(1, i + 1);
end

% Simplify equation
simplified_eq = simplify(symbolic_eq);
disp('Simplified Interpolation Polynomial:')
disp(simplified_eq)

% Evaluate at actual s
interp_val = double(subs(simplified_eq, s_sym, s_val));
fprintf('\nInterpolated value of tan(%.2f) = %.6f\n', xp, interp_val);

% Plot the interpolation polynomial
figure;
fplot(@(s_eval) double(subs(simplified_eq, s_sym, s_eval)), [0, n-1], 'b', 'LineWidth', 2)
hold on
plot(s_val, interp_val, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
xlabel('s = (x - x_0)/h')
ylabel('Interpolated tan(x)')
title('Newton Forward Interpolation for tan(x)')
legend('Interpolation Polynomial','Interpolated Point')
grid on
