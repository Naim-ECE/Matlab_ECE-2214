clc;
clear;
p = [0; 0; 1; 1];
q = [0; 1; 0; 1];
fprintf('p    q    p->q   q->p  ~p->~q  ~q->~p\n');
for i = 1:length(p)
    result1 = ~p(i) | q(i);
    result2 = ~q(i) | p(i);
    result3 = p(i) | ~q(i);
    result4 = q(i) | ~p(i);
    fprintf('%d\t %d\t  \t%d\t \t%d\t \t%d\t \t%d\n', p(i), q(i), result1, result2, result3, result4);
end
if result1 == result4
        fprintf("propositional logic and contrapositive are equal\n");
end
if result2 == result3
        fprintf("converse and inverse are equal\n");
end
