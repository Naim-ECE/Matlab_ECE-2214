clc;
clear;
p = [0 0 1 1]';
q = [0 1 0 1]';

implication = ~p | q;

T = table(p, q, implication, ...
    'VariableNames', {'p', 'q', 'p->q'});
disp(T);
