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

p = [0; 1];
count = 0;
fprintf('p      ~p    (p | ~p)\n');
fprintf('-----------------------\n'); % Optional: Add a separator for clarity

% Create a cell array to map 0 and 1 to 'false' and 'true'
logical_strings = {'false', 'true'}; 

for i = 1:length(p)
    % The result of the logical operation will be 0 or 1
    result = ~p(i) | p(i);
    
    if result == 1
        count = count + 1;
    end
    
    % Access the correct string from the cell array
    % Note: logical values (0 or 1) are used as indices by adding 1
    p_str = logical_strings{p(i) + 1};
    not_p_str = logical_strings{~p(i) + 1};
    result_str = logical_strings{result + 1};
    
    % Print the strings using the %s format specifier
    fprintf('%s   %s   %s\n', p_str, not_p_str, result_str);
end