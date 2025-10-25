clc;
clear;

Set_A_input = ["a" "b" "c"];
count = 0;

Set_A = unique(Set_A_input);
n = length(Set_A);
num_subsets = 2^n;

fprintf('Defined Set A {%s}\n', join(Set_A, ', '));
fprintf('Number of elements: %d\n', n);
fprintf('Total expected subsets 2^A: %d\n', num_subsets);

fprintf('\n');
disp('Generated Subsets (The Power Set):');

for i = 0 : num_subsets - 1
    binary_rep = dec2bin(i, n);
    
    indices_to_include = (binary_rep == '1');
    
    current_subset = Set_A(indices_to_include);
    
    count = count + 1;
    
    if isempty(current_subset)
        disp('  {}');
    else
        subset_string = join(current_subset, ', ');
        fprintf('  {%s}\n', subset_string);
    end
end

fprintf('\nTotal Subsets Generated: %d\n', count);
fprintf('\n');