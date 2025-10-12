clc;
clear;
p = [0 0 1 1]';
q = [0 1 0 1]';

AND = p & q;
OR = p | q;
XOR = xor(p, q);
NOT = ~p;

T = table(p, q, AND, OR, XOR, NOT, ...
    'VariableNames', {'p', 'q', 'p&q', 'p|q', 'p_xor_q', '~p'});
disp(T);
