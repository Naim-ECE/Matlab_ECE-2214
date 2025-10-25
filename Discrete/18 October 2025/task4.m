clc;
clear;

U = [1 2 3 4 5 6 7 8 9 10];
A = [2 4 6 8 10];

fprintf('U = {%s}\n', num2str(U));
fprintf('A = {%s}\n', num2str(A));

A_complement = setdiff(U, A);

fprintf('A complement (U-A) = {%s}\n', num2str(A_complement));
