clc;
clear;
disp('Three-Set Venn Diagram (Visual Representation)');

U = 1:10;
A = [1 2 3 4];
B = [3 4 5 6];
C = [5 6 7 8];

A_only = setdiff(A, union(B, C));
B_only = setdiff(B, union(A, C));
C_only = setdiff(C, union(A, B));

A_int_B_only = setdiff(intersect(A, B), C);
A_int_C_only = setdiff(intersect(A, C), B);
B_int_C_only = setdiff(intersect(B, C), A);

A_int_B_int_C = intersect(A, intersect(B, C));

None_only = setdiff(U, union(A, union(B, C)));

figure('Color', 'w');
axis equal off;
xlim([-1 6]);
ylim([-1 4]);

viscircles([1 2], 1.5, 'Color', [0 0.447 0.741], 'LineStyle', '-', 'LineWidth', 2);
text(1, 3.8, 'A', 'FontSize', 14, 'FontWeight', 'bold');

viscircles([3 2], 1.5, 'Color', [0.85 0.325 0.098], 'LineStyle', '-', 'LineWidth', 2);
text(3, 3.8, 'B', 'FontSize', 14, 'FontWeight', 'bold');

viscircles([2 0.5], 1.5, 'Color', [0.929 0.694 0.125], 'LineStyle', '-', 'LineWidth', 2);
text(2, -1, 'C', 'FontSize', 14, 'FontWeight', 'bold');

text(0.5, 2.5, num2str(A_only), 'Color', 'k', 'FontSize', 12);
text(3.5, 2.5, num2str(B_only), 'Color', 'k', 'FontSize', 12);
text(2.5, 0, num2str(C_only), 'Color', 'k', 'FontSize', 12);
text(2.1, 2.7, num2str(A_int_B_only), 'Color', 'k', 'FontSize', 12);
text(1.2, 1.2, num2str(A_int_C_only), 'Color', 'k', 'FontSize', 12);
text(2.9, 1.2, num2str(B_int_C_only), 'Color', 'k', 'FontSize', 12);
text(2, 2, num2str(A_int_B_int_C), 'Color', 'k', 'FontSize', 12, 'FontWeight', 'bold');
text(5.5, 3.5, ['Universe: ', num2str(None_only)], 'Color', 'k', 'FontSize', 10);
title('Venn Diagram for Sets A, B, and C');
