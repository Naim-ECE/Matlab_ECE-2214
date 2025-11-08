clc;
clear;
syms x;

f_sym = x^3 + 2*x - 15;
df_sym = diff(f_sym);

f = matlabFunction(f_sym);
df = matlabFunction(df_sym);

a = input("Enter the value of a: ");

fn = newton_raphson_m(a, f, df);

function fn = newton_raphson_m(a, f, df)
    
    fprintf('i        a           x          f(x)\n');

    for i = 1 : 100

        b = f(a);
        c = df(a);

        x1 = a - (b / c);

        val = abs(f(x1));
        fprintf('%i   \t%.3f   \t%.3f   \t%.3f\n', i, a, x1, val);

        %T = table(i, a, x1, val, ...
         %   'VariableNames', {'i', 'a', 'x', 'f(x)'});
        %disp(T)

        if val <= 0.001
            break;
        end

        a = x1;
    end
    fprintf("x = %.3f\n", x1);

    fn = x1;
end