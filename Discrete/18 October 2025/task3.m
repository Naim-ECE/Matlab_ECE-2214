clc;
clear;

disp('Element Membership Checker');

Set_A_input = input('Enter the elements of the Set A (e.g., [10 20 30 40]): ');
Set_A = unique(Set_A_input);

fprintf('Defined Set A: {%s}\n', num2str(Set_A));

Element_X = input('Enter the single element (X) to check for membership: ');

fprintf('\n');

is_present = ismember(Element_X, Set_A);

fprintf('Checking if Element X (%g) belongs to Set A...\n', Element_X);

if is_present == 1
    disp('Result: TRUE');
    fprintf('The element %g BELONGS to the set A.\n', Element_X);
else
    disp('Result: FALSE');
    fprintf('The element %g DOES NOT belong to the set A.\n', Element_X);
end
fprintf('\n');
