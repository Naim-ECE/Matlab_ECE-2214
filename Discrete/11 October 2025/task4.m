clc;
clear;
p = [0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]';
q = [0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1]';
r = [0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1]';
s = [0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1]';
implication = ~(p & q) | (~r | s);

T = table(p, q, r, s, implication, ...
    'VariableNames',{'p', 'q', 'r', 's', '(p & q) -> (~r | s)'});
disp(T);
