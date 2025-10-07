clc; 
clear;
n = 1:20;
p = mod(n,4)==0;
q = mod(n,2)==0;

implication = ~p | q;
converse = ~q | p;
inverse = p | ~q;
contrapositive = q | ~p;

T = table(n', p', q', implication', converse', inverse', contrapositive', ...
    'VariableNames', {'numbers','p','q','p->q','q->p','~p->~q','~q->~p'});
disp(T);
