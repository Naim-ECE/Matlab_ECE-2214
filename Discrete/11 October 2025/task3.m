clc;
clear;
p = [0 0 1 1]';
q = [0 1 0 1]';

LHS1 = ~(p & q);
LHS2 = ~(p | q);
RHS1 = ~p | ~q;
RHS2 = ~p & ~q;

T = table(p, q, LHS1, RHS1, LHS2, RHS2, ...
    'VariableNames', {'p', 'q', '~(p&q)', '~p|~q', '~(p|q)', '~p&~q'});
disp(T);

if all(LHS1 == RHS1)
    fprintf('~(p&q) & ~p|~q are equivalent\n');
end
if all(LHS2 == RHS2)
    fprintf('~(p|q) & ~p&~q are equivalent\n');
end
