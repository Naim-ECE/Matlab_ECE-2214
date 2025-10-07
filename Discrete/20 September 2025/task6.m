clc;
clear;
p = [0 0 0 0 1 1 1 1];
q = [0 0 1 1 0 0 1 1];
r = [0 1 0 1 0 1 0 1];

implication = ~(p & q) | r;
converse = ~r | (p & q);
inverse = (p & q) | ~r;
contrapositive = r | ~(p & q);

T = table(p', q', r', implication', converse', inverse', contrapositive', ...
    'VariableNames', {'p', 'q', 'r', '(p^q)->r', 'r->(p^q)', '~(p^q)->~r', ...
    '~r->~(p^q)'});
disp(T);

if all(implication == contrapositive)
    fprintf("Implication and contrapositive are the same\n");
else
    fprintf("Implication and contrapositive are not the same\n")
end

if all(converse == inverse)
    fprintf("Converse and inverse are the same\n");
else
    fprintf("Converse and inverse are not the same\n")
end
