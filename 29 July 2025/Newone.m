% Step 1: Input data
x = [1 2 3 4 5];
y = [1 8 27 64 125]; 

n = length(x);
diff_table = zeros(n, n);
diff_table(:,1) = y';

% Step 2: Construct the forward difference table
for j = 2:n
    for i = 1:n-j+1
        diff_table(i,j) = diff_table(i+1,j-1) - diff_table(i,j-1);
    end
end
disp('1. Difference Table:');
disp(diff_table);

% Step 3: Build the simplified equation
syms p
h = x(2) - x(1);
syms X
p_sym = (X-x(1))/h;
newton_poly = y(1);
prod_term = 1;

for i = 1:n-1
    prod_term = prod_term * (p_sym-(i-1))/i;
    newton_poly = newton_poly + prod_term*diff_table(1,i+1);
end

newton_poly = expand(newton_poly);
disp('2. Simplified Interpolation Equation:');
pretty(newton_poly)

% Step 4: Graph of the interpolation equation
f = matlabFunction(newton_poly);
xx = linspace(x(1), x(end), 100);
yy = f(xx);

figure;
plot(x, y, 'ro', 'MarkerFaceColor','r'); hold on;
plot(xx, yy, 'b-', 'LineWidth',2);
legend('Data points','Interpolation Polynomial');
xlabel('x'); ylabel('y');
title('Newton''s Forward Interpolation Polynomial');

% Step 5: Calculated value at a specific point
value = 2.5;
calculated = double(subs(newton_poly, X, value));
fprintf('4. Calculated value at x = %.2f is %.4f\n', value, calculated);