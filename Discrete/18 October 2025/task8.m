clc;
clear;

A = [1 2 3];
B = [2 3 4];
U = union(A, B);
LHS1 = setdiff(U, union(A, B));
LHS2 = setdiff(U, intersect(A, B));
RHS1 = intersect(setdiff(U, A), setdiff(U, B));
RHS2 = union(setdiff(U, A), setdiff(U, B));
if isequal(LHS1, RHS1)
    fprintf("(AUB)' = A'nB'\n");
end
if isequal(LHS2, RHS2)
    fprintf("(AnB)' = A'UB'\n");    
end
