clc;
clear;
p = [0; 0; 1; 1];
q = [0; 1; 0; 1];

fprintf('p    q    p & q    p | q    p xor q    p -> q     q -> p    p <-> q    (p -> q) | (q -> p)\n');

for i = 1:length(p)
    result1 = p(i) & q(i);
    result2 = p(i) | q(i);
    result3 = xor(p(i), q(i));
    result4 = (~p(i) | q(i));
    result5 = (~q(i) | p(i));
    result6 = p(i) == q(i);
    result7 = ((~p(i) | q(i)) | ~q(i) | p(i));
    
    fprintf('%d\t %d\t \t%d\t \t%d\t \t%d\t \t\t%d\t', p(i), q(i), result1, result2, result3, result4);
    fprintf('\t\t%d\t \t%d\t \t\t%d\n', result5, result6, result7);
end
fprintf("\n");

% not q
fprintf('q    ~q\n');

for i = 1:length(q) - 2
    result = ~q(i);
    
    fprintf('%d\t %d\n', q(i), result);
end
fprintf("\n");

% (p or q) & r
p = [0; 0; 0; 0; 1; 1; 1; 1];
q = [0; 0; 1; 1; 0; 0; 1; 1];
r = [0; 1; 0; 1; 0; 1; 0; 1];

fprintf('p    q    r    (p | q) & r    (p & r) | ~q    (p -> q) & (q -> r)    (p <-> r) | ~q\n');

for i = 1:length(p)
    result1 = ((p(i) | q(i)) & r(i));
    result2 = ((p(i) & r(i)) | ~q(i));
    result3 = (~p(i) | q(i)) & (~q(i) | r(i));
    result4 = (p(i) == r(i)) | ~q(i);
    
    fprintf('%d\t %d\t  %d\t \t\t%d\t \t\t%d\t \t\t\t%d\t \t\t\t\t%d\n', p(i), q(i), r(i), result1, result2, result3, result4);
end
fprintf("\n");
