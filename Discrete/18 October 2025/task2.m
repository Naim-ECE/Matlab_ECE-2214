clc;
clear;

disp('MATLAB Set Operations Calculator');

A_input = [1 2 3 4 5];
B_input = [4 5 6 7 8];

A = unique(A_input);
B = unique(B_input);

fprintf('\nDefined Set A: {%s}\n', num2str(A));
fprintf('Defined Set B: {%s}\n', num2str(B));

disp('Results of Set Operations');

A_union_B = union(A, B);
fprintf('1. Union (A U B):\n');
disp(A_union_B);

A_intersection_B = intersect(A, B);
fprintf('2. Intersection (A n B):\n');
disp(A_intersection_B);

A_difference_B = setdiff(A, B);
fprintf('3. Difference (A - B):\n');
disp(A_difference_B);

B_difference_A = setdiff(B, A);
fprintf('   Difference (B - A):\n');
disp(B_difference_A);

A_symmetric_diff_B = union(A_difference_B, B_difference_A);
fprintf('4. Symmetric Difference (A XOR B):\n');
disp(A_symmetric_diff_B);
fprintf('\n');
