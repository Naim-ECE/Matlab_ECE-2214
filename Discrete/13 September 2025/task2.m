% (p & q) or ~r
p = [0; 0; 0; 0; 1; 1; 1; 1];
q = [0; 0; 1; 1; 0; 0; 1; 1];
r = [0; 1; 0; 1; 0; 1; 0; 1];
fprintf('p    q    r    (p & q) | ~r\n');

for i = 1:length(p)
    result = ((p(i) & q(i)) | ~r(i));
    
    fprintf('%d\t %d\t  %d\t \t\t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n");

% (p -> q) <-> (~q -> ~p)
p = [0; 0; 1; 1];
q = [0; 1; 0; 1];
fprintf('p    q    (p -> q) <-> (~q -> ~p)\n');

for i = 1:length(p)
    result = ((~p(i) | q(i)) == (q(i) | ~p(i)));
    
    fprintf('%d\t %d\t \t\t\t%d\n', p(i), q(i), result);
end
fprintf("\n");

% (p or q) & (~p or r)
p = [0; 0; 0; 0; 1; 1; 1; 1];
q = [0; 0; 1; 1; 0; 0; 1; 1];
fprintf('p    q    r    (p | q) & (~p | r)\n');

for i = 1:length(p)
    result = ((p(i) | q(i)) & (~p(i) | r(i)));
    
    fprintf('%d\t %d\t  %d\t \t\t\t%d\n', p(i), q(i), r(i), result);
end
fprintf("\n");
