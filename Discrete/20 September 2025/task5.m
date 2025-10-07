clc;
clear;
p = [0 0 1 1];
q = [0 1 0 1];

ali = ~p | q;
sara = q | ~p;
rafi = q | p;

T = table(p', q', ali', sara', rafi', ...
    'VariableNames', {'p', 'q', 'p->q', '~q->~p', 'q->p'});
disp(T);

if all(ali == sara)
    fprintf('Ali and Sara both of their conditions are logically equivalent\n');
end
