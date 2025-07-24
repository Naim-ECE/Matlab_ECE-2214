f = @(x) x^2 + 3*x - 1;
a = input("Enter the value of a: ");
b = input("Enter the value of b: ");

for i = 1 : 100
    x = (a + b) / 2;
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