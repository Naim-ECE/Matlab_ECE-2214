n = input("How many numbers you want: ");
sum = 0;
fprintf("Enter array elements: \n");
for i = 1 : n
    num = input("");
    sum = sum + num;
end
fprintf("Average is = %.2f", sum / n);