clc;
clear;
p = [0; 0; 1; 1];
q = [0; 1; 0; 1];
bool_str = {'false', 'true'};
fprintf('p  \t\tq  \t\tp->q  \t~q->~p  \tq->p  ~p->~q\n');
for i = 1 : length(p)
    result1 = ~p(i) | q(i);
    result2 = q(i) | ~p(i);
    result3 = ~q(i) | p(i);
    result4 = p(i) | ~q(i);

    p_str = bool_str{p(i) + 1};
    q_str = bool_str{q(i) + 1};
    result1_str = bool_str{result1 + 1};
    result2_str = bool_str{result2 + 1};
    result3_str = bool_str{result3 + 1};
    result4_str = bool_str{result4 + 1};
    
    fprintf('%s   %s   %s   %s    %s     %s\n', p_str, q_str, result1_str, result2_str, result3_str, result4_str);
end
if result1 == result2
    fprintf('\np->q & contrapositive are equal\nconverse & inverse are equal\n\n');
else
    fprintf('\nThey are not equal\n');
end

fprintf('p  \t\tq  \t\tp->q  \tq->p  \t(p->q)^(q->p)  p<->q\n');
for i = 1 : length(p)
    result1 = ~p(i) | q(i);
    result2 = ~q(i) | p(i);
    result3 = result1 & result2;
    result4 = p(i) == q(i);

    p_str = bool_str{p(i) + 1};
    q_str = bool_str{q(i) + 1};
    result1_str = bool_str{result1 + 1};
    result2_str = bool_str{result2 + 1};
    result3_str = bool_str{result3 + 1};
    result4_str = bool_str{result4 + 1};
    
    fprintf('%s   %s   %s   %s    %s     \t\t%s\n', p_str, q_str, result1_str, result2_str, result3_str, result4_str);
end
if result3 == result4
    fprintf('\np↔q and both converse & original statement hold are equal\n\n');
else
    fprintf('\nThey are not equal\n');
end
