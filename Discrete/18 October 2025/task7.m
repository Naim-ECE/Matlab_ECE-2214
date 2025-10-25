function task7()
clc;

A = unique(randi(10, 1, 5));
B = unique(randi(10, 1, 5));

fprintf('A = [  ');
fprintf('%g ', A);
fprintf(']\n');
fprintf('B = [');
fprintf('%g ', B);
fprintf(']\n');

isSubset   = all(ismember(A, B));
isSuperset = all(ismember(B, A));

if isSubset && isSuperset
    disp('A and B have the same elements');
elseif isSubset
    disp('A is a subset of B');
elseif isSuperset
    disp('A is a superset of B');
else
    disp('A is neither a subset nor a superset of B');
end

end
