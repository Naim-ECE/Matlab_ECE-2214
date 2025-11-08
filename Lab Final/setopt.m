clc;
clear;

p = [0 0 1 1]';
q = [0 1 0 1]';

res1 = ~p | q;
res2 = ~q | p;
res3 = p | ~q;
res4 = q | ~p;

T = table(p, q, res1, res2, res3, res4, ...
    'VariableNames', {'p', 'q', 'p->q', 'q->p', '~p->~q', '~q->~p'});
disp(T);

