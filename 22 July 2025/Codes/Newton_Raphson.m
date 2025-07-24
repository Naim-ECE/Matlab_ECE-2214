syms x % declared x for df

f = @(x) x^3 - 2*x - 5;
a = input("Enter the value of a: ");
df = diff(x^3 - 2*x - 5);

fn = newton_raphson(a, f, df, x);

function fn = newton_raphson(a, f, df, x)
for i = 1 : 100
    b = abs(f(a));
    c = subs(df, x, a);
  
    x1 = a - (b / c);
    val = abs(f(x1));
    if abs(f(x1)) <= 0.001
        break;
    end

    if i == 1
        fprintf("i\t a\t\t x\t\t f(x)\n");
    end
    fprintf("%i\t %.3f\t %.3f\t %.3f\t", i, a, x1, val);
    fprintf("\n");

    a = x1; % returns the root
end
fprintf("The value of x is %.3f\n: ", x1);
fn = x1;
end