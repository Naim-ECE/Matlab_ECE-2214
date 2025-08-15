function classroom_code()
clc;
clear all;
close all;
fprintf('Newton''s Forward Interpolation Formula\n\n');

% Input data points
x = input('Enter x values as a vector (e.g., [0 1 2 3]): ');
y = input('Enter y values as a vector (e.g., [1 2 4 8]): ');

% Point to interpolate
x_interp = input('Enter the point to interpolate: ');

% Check if lengths match
if length(x) ~= length(y)
    error('x and y must have the same length');
end

n = length(x);
h = x(2) - x(1); % Fixed: Added minus operator

% Create forward difference table
diff_table = zeros(n, n);
diff_table(:,1) = y';

for j = 2:n
    for i = 1:n-j+1
        diff_table(i,j) = diff_table(i+1,j-1) - diff_table(i,j-1); % Fixed: Added minus operator
    end
end

% Create variable names for the table
varNames = cell(1,n);
varNames{1} = 'y';
for k = 2:n
    varNames{k} = sprintf('Δ^%dy', k-1);
end

% Create row names
rowNames = arrayfun(@(i) sprintf('x%d', i-1), 0:n-1, 'UniformOutput', false);

fprintf('\nForward Difference Table:\n');
disp(array2table(diff_table, 'VariableNames', varNames, 'RowNames', rowNames));

% Calculate the interpolating polynomial
syms t;
s = (t - x(1)) / h; % Fixed: Added minus operator
poly = diff_table(1,1);
product = 1;

for k = 2:n
    product = product * (s - (k-2)); % Fixed: Added minus operator
    poly = poly + (product * diff_table(1,k)) / factorial(k-1);
end

% Simplify the polynomial
poly = simplify(expand(poly));
fprintf('\nInterpolating Polynomial:\n');
disp(poly);

% Calculate the interpolated value
s_val = (x_interp - x(1)) / h; % Fixed: Added minus operator
y_interp = subs(poly, t, x_interp);

fprintf('\nInterpolated value at x = %.4f is y = %.6f\n', x_interp, double(y_interp));

% Plot the results
figure;
plot(x, y, 'bo', 'MarkerSize', 8, 'LineWidth', 2); 
hold on;

% Plot the interpolating polynomial
x_plot = linspace(min(x), max(x), 100);
y_plot = double(subs(poly, t, x_plot)); % Fixed: Added double() conversion
plot(x_plot, y_plot, 'r-', 'LineWidth', 1.5);

% Plot the interpolated point
plot(x_interp, double(y_interp), 'g*', 'MarkerSize', 10, 'LineWidth', 2); % Fixed: Added double() conversion

title('Newton''s Forward Interpolation');
xlabel('x');
ylabel('y');
legend('Data Points', 'Interpolating Polynomial', 'Interpolated Point', 'Location', 'best');
grid on;
hold off;
end