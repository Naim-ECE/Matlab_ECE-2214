function newton_interpolation_eqn_gen()
clc;
clear all;
close all;
fprintf('Newton''s Forward Interpolation Formula\n\n');

% Input data points
x = input('Enter x values as a vector (e.g., [0 1 2 3]): ');
y = input('Enter y values as a vector (e.g., [1 2 4 8]): ');
x_interp = input('Enter the point to interpolate: ');

% Validate input
if length(x) ~= length(y)
    error('x and y must have the same length');
end

n = length(x);
h = x(2) - x(1);

% Forward difference table
diff_table = zeros(n, n);
diff_table(:,1) = y';

for j = 2:n
    for i = 1:n-j+1
        diff_table(i,j) = diff_table(i+1,j-1) - diff_table(i,j-1);
    end
end

% Display difference table
varNames = ['y', arrayfun(@(k) sprintf('Δ^%dy', k), 1:n-1, 'UniformOutput', false)];
rowNames = arrayfun(@(i) sprintf('x%d', i), 0:n-1, 'UniformOutput', false);

fprintf('\nForward Difference Table:\n');
disp(array2table(diff_table, 'VariableNames', varNames, 'RowNames', rowNames));

% Construct interpolating polynomial in terms of s
syms s;
poly = diff_table(1,1);
product = 1;

for k = 2:n
    product = product * (s - (k-2));
    poly = poly + (product * diff_table(1,k)) / factorial(k-1);
end

poly = simplify(expand(poly));
fprintf('\nInterpolating Polynomial (in s):\n');
disp(poly);

% Evaluate interpolated value
s_val = (x_interp - x(1)) / h;
y_interp = subs(poly, s, s_val);

fprintf('\nInterpolated value at x = %.4f is y = %.6f\n', x_interp, double(y_interp));

% Plotting
figure;
plot(x, y, 'bo', 'MarkerSize', 8, 'LineWidth', 2); 
hold on;

x_plot = linspace(min(x), max(x), 100);
s_plot = (x_plot - x(1)) / h;
y_plot = double(subs(poly, s, s_plot));
plot(x_plot, y_plot, 'r-', 'LineWidth', 1.5);
plot(x_interp, double(y_interp), 'g*', 'MarkerSize', 10, 'LineWidth', 2);

title('Newton''s Forward Interpolation');
xlabel('x');
ylabel('y');
legend('Data Points', 'Interpolating Polynomial', 'Interpolated Point', 'Location', 'best');
grid on;
hold off;
end