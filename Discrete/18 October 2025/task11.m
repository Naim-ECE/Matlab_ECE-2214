clc;
clear;
disp('Cartesian Product (A x B)');
A = [1 2];
B = ["x" "y" "z"];
numA = length(A);
numB = length(B);
product = cell(numA * numB, 2);
k = 1;
for i = 1:numA
    for j = 1:numB
        product{k, 1} = A(i);
        product{k, 2} = B(j);
        k = k + 1;
    end
end
disp('Cartesian Product A x B:');
disp(product);
