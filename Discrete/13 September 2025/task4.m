% p or ~p
clc;
clear;
p = [0; 1];
count = 0;
fprintf('p    ~p    (p | ~p)\n');

for i = 1:length(p)
    result = ~p(i) | p(i);
    if result == 1
        count = count + 1;
    end
    fprintf('%d\t  %d\t    \t%d\n', p(i), ~p(i), result);
end
fprintf("\n");
if count == length(p)
    fprintf("It's a Tautology\n");
elseif count == 0
    fprintf("It's a Contradiction\n");
else
    fprintf("It's a Contingency\n");
end
% p & ~p
p = [0; 1];
count = 0;
fprintf('p    ~p    (p & ~p)\n');

for i = 1:length(p)
    result = ~p(i) & p(i);
    if result == 1
        count = count + 1;
    end
    fprintf('%d\t  %d\t    \t%d\n', p(i), ~p(i), result);
end
fprintf("\n");
if count == length(p)
    fprintf("It's a Tautology\n");
elseif count == 0
    fprintf("It's a Contradiction\n");
else
    fprintf("It's a Contingency\n");
end
% (p -> q) or (q -> p)
p = [0; 0; 1; 1];
q = [0; 1; 0; 1];
count = 0;
fprintf('p    q    (~p|q)|(~q|p)\n');

for i = 1:length(p)
    result = (~p(i) | q(i)) | (~q(i) | p(i));
    if result == 1
        count = count + 1;
    end
    fprintf('%d\t  %d\t    \t%d\n', p(i), q(i), result);
end
fprintf("\n");
if count == length(p)
    fprintf("It's a Tautology\n");
elseif count == 0
    fprintf("It's a Contradiction\n");
else
    fprintf("It's a Contingency\n");
end