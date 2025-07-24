f = @(x) x^3 - 2*x - 5;
a = input("Enter the value of a: ");
b = input("Enter the value of b: ");

x = secant(f, a, b);

function x = secant(f, a, b)
    for i = 1 : 100
        c = abs(f(a));
        d = abs(f(b));
    
        x = b - d * ((b - a) / (d - c));
        val = abs(f(x));
        if abs(f(x)) <= 0.001
            break;
        end
        a = b;
        b = x;
        if i == 1
            fprintf("i\t x\t\t a\t\t b\t\t f(x)\n");
        end
        fprintf("%i\t %.3f\t %.3f\t %.3f\t %.3f\t", i, x, a, b, val);
        fprintf("\n");
    end
    fprintf("The value of x is %.3f\n: ", x);
end