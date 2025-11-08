clc;
clear;

syms x;
f_sym = x^3 - 2*x -5;
f = matlabFunction(f_sym);

a = input("Enter the value of a: ");
b = input("Enter the value of b: ");

x = secant_m(f, a, b);

function x = secant_m(f, a, b)
fprintf("i        a       b       x       f(x)\n");
    for i = 1 : 100
        c = f(a);
        d = f(b);

        x = b - d * ((b - a) / (d - c));
        val = f(x);
        fprintf("%i     %.3f    %.3f    %.3f   %.3f\n", i, a, b, x, val);
        if abs(f(x)) <= 0.001
            break;
        end
        a = b;
        b = x;
    end
    fprintf("x = %.3f\n", x);
end
