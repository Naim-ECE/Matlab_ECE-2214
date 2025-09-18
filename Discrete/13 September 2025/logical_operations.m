p = [0; 0; 1; 1];
q = [0; 1; 0; 1];

% p and q
fprintf('p    q    p & q\n');

for i = 1:length(p)
    result = p(i) & q(i);
    
    fprintf('%d\t %d\t \t%d\n', p(i), q(i), result);
end
fprintf("\n");

% p or q
fprintf('p    q    p | q\n');

for i = 1:length(p)
    result = p(i) | q(i);
    
    fprintf('%d\t %d\t \t%d\n', p(i), q(i), result);
end
fprintf("\n");

% p xor q
fprintf('p    q    p xor q\n');

for i = 1:length(p)
    result = xor(p(i), q(i));
    
    fprintf('%d\t %d\t \t%d\n', p(i), q(i), result);
end
fprintf("\n");

% not q
fprintf('q    ~q\n');

for i = 1:length(q) - 2
    result = ~q(i);
    
    fprintf('%d\t %d\n', q(i), result);
end
fprintf("\n");

% p -> q
fprintf('p    q    p -> q\n');

for i = 1:length(p)
    result = (~p(i) | q(i));
    
    fprintf('%d\t %d\t \t%d\n', p(i), q(i), result);
end
fprintf("\n");

% q -> p
fprintf('q    p    q -> p\n');

for i = 1:length(p)
    result = (~q(i) | p(i));
    
    fprintf('%d\t %d\t \t%d\n', q(i),p(i), result);
end
fprintf("\n");

% p <-> q
fprintf('p    q    p <-> q\n');

for i = 1:length(p)
    result = p(i) == q(i);
    
    fprintf('%d\t %d\t \t%d\n', p(i), q(i), result);
end
fprintf("\n");

% (p -> q) or (q -> p)
fprintf('p    q    (p -> q) | (q -> p)\n');

for i = 1:length(p)
    result = ((~p(i) | q(i)) | ~q(i) | p(i));
    
    fprintf('%d\t %d\t\t\t\t%d\n', p(i), q(i), result);
end
fprintf("\n");

% (p or q) & r
p = [0; 0; 0; 0; 1; 1; 1; 1];
q = [0; 0; 1; 1; 0; 0; 1; 1];
r = [0; 1; 0; 1; 0; 1; 0; 1];

fprintf('p    q    r    (p | q) & r\n');

for i = 1:length(p)
    result = ((p(i) | q(i)) & r(i));
    
    fprintf('%d\t %d\t  %d\t \t\t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n");

% (p and r) or (not q)
fprintf('p    q    r    (p & r) | ~q\n');

for i = 1:length(p)
    result = ((p(i) & r(i)) | ~q(i));
    
    fprintf('%d\t %d\t  %d\t \t\t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n");

% (p -> q) & (q -> r)
fprintf('p    q    r    (p -> q) & (q -> r)\n');

for i = 1:length(p)
    result = (~p(i) | q(i)) & (~q(i) | r(i));
    
    fprintf('%d\t %d\t  %d\t \t\t\t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n");

% (p <-> r) or (not q)
fprintf('p    q    r    (p <-> r) | ~q\n');

for i = 1:length(p)
    result = (p(i) == r(i)) | ~q(i);
    
    fprintf('%d\t %d\t  %d\t   \t\t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n");
