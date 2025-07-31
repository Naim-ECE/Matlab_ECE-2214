clc; clear;

% Sample data
x = [1 2 3 4];       % x values
y = [1 8 27 64];     % y values (e.g., y = x^3)

% Step size
h = x(2) - x(1);
n = length(x);
diff_table = zeros(n, n);
diff_table(:,1) = y';

% Compute forward differences
for j = 2:n
    for i = 1:n-j+1
        diff_table(i,j) = diff_table(i+1,j-1) - diff_table(i,j-1);
    end
end

% Display difference table
disp('Forward Difference Table:')
disp(diff_table)

% Interpolation at a given point
xp = 2.5;                        % Point to interpolate
s = (xp - x(1)) / h;             % s = (x - x0)/h
interp_val = y(1);              % Start with y0
term = 1;
symbolic_eq = y(1);             % To build the symbolic equation

syms s_sym
for i = 1:n-1
    term = term * (s_sym - (i-1)) / i;
    interp_val = interp_val + term * diff_table(1,i+1);
    symbolic_eq = symbolic_eq + term * diff_table(1,i+1);
end

% Simplify equation
simplified_eq = simplify(symbolic_eq);
disp('Simplified Interpolation Polynomial:')
disp(simplified_eq)

% Interpolated value
s_val = (xp - x(1)) / h;
calc_val = double(subs(simplified_eq, s_sym, s_val));
fprintf('\nInterpolated value at x = %.2f is %.4f\n', xp, calc_val);

% Plot
fplot(@(s_eval) double(subs(simplified_eq, s_sym, s_eval)), [0, n-1], 'LineWidth', 2)
hold on
plot((xp - x(1))/h, calc_val, 'ro', 'MarkerSize', 10)
xlabel('s = (x - x_0)/h')
ylabel('Interpolated f(x)')
title('Newton Forward Interpolation')
grid on
legend('Interpolating Polynomial', 'Interpolated Point')
