%% f = @(x) 4 * exp(-x) * sin(x) - 1;
f = @(x) x^2 + 3*x - 1; %% putting a = 2 & b = 0
a = input("Enter the value of a: ");
b = input("Enter the value of b: ");

for i = 1 : 9000
    c = abs(f(a));
    d = abs(f(b));
    x = (a * d - b * c) / (d - c);
    if abs(f(x)) <= 0.001
        break;
    end
    val = abs(f(x));
    if f(x) > 0
        a = x;
    else
        b = x;
    end
    if i == 1
        fprintf("i\t x\t\t a\t\t b\t\t f(x)\n");
    end
    fprintf("%i\t %.3f\t %.3f\t %.3f\t %.3f\t", i, x, a, b, val);
    fprintf("\n");
        
end
fprintf("The value of x is %.3f\n: ", x);