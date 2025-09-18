% (p -> q) == (~p or q)
p = [0; 0; 1; 1];
q = [0; 1; 0; 1];
fprintf('p    q    (p -> q)\n');

for i = 1:length(p)
    result1 = ~p(i) | q(i);
    
    fprintf('%d\t %d\t   \t%d\n', p(i), q(i), result);
end
fprintf("\n");
fprintf('p    q    (~p | q)\n');

for i = 1:length(p)
    result2 = ~p(i) | q(i);
    
    fprintf('%d\t %d\t   \t%d\n', p(i), q(i), result);
end
fprintf("\n");

if result1 == result2
    fprintf("Both expressions are equal\n\n");
else 
    fprintf("Both expressions are not equal\n\n");
end

% (p or q) or r == p or (q or q)
p = [0; 0; 0; 0; 1; 1; 1; 1];
q = [0; 0; 1; 1; 0; 0; 1; 1];
r = [0; 1; 0; 1; 0; 1; 0; 1];
fprintf('p    q    r    (p -> q)\n');

for i = 1:length(p)
    result1 = (p | q) | r;
    
    fprintf('%d\t %d\t  %d\t   \t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n");
fprintf('p    q    r    (~p | q)\n');

for i = 1:length(p)
    result2 = p | (q | r);
    
    fprintf('%d\t %d\t  %d\t   \t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n");

if result1 == result2
    fprintf("Both expressions are equal\n\n");
else 
    fprintf("Both expressions are not equal\n\n");
end

% p & (q or r) == (p & q) or (p & r)
p = [0; 0; 0; 0; 1; 1; 1; 1];
q = [0; 0; 1; 1; 0; 0; 1; 1];
r = [0; 1; 0; 1; 0; 1; 0; 1];
fprintf('p    q    r    p & (q | r)\n');

for i = 1:length(p)
    result1 = p & (q | r);
    
    fprintf('%d\t %d\t  %d\t   \t\t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n");
fprintf('p    q    r    (p & q) | (p & r)\n');

for i = 1:length(p)
    result2 = (p & q) | (p & r);
    
    fprintf('%d\t %d\t  %d\t   \t\t\t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n\n");

if result1 == result2
    fprintf("Both expressions are equal\n");
else 
    fprintf("Both expressions are not equal\n");
end
fprintf("\n")
