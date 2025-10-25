clc;
clear;

Set_A_input = [1 2 3];
count = 0;

Set_A = unique(Set_A_input);
n = length(Set_A);
num_subsets = 2^n;

fprintf('\nDefined Set A (elements mapped to numbers): {%s}\n', num2str(Set_A));
fprintf('Number of elements (|A|): %d\n', n);
fprintf('Total expected subsets (2^|A|): %d\n', num_subsets);

fprintf('\n');
disp('Generated Subsets (The Power Set):');

for i = 0 : num_subsets - 1
    binary_rep = dec2bin(i, n);
    
    current_subset = [];
    
    for j = 1 : n
        if binary_rep(j) == '1'
            current_subset = [current_subset, Set_A(j)];
        end
    end
    
    count = count + 1;
    
    if isempty(current_subset)
        disp('  {}');
    else
        fprintf('  {%s}\n', num2str(current_subset));
    end
end

fprintf('\nTotal Subsets Generated: %d\n', count);
fprintf('\n');