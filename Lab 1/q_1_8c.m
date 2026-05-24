% ODE C
c1 = 3;
c2 = 1;
c3 = 4;
a = 1;
b = 5;
u_g = 9;
u_b = 2;

f = @(x) exp(sin(x));

n = 100;

% Matlab built in solution (bvp5c):
% sol = bvp4c(@(x, y) [y(2); (-c2 * y(2) - c3 * y(1)) / c1], @(ya, yb) [ya(1) - u_g; yb(1) - u_b], bvpinit(linspace(a, b, 25), [u_g; 0]));

% x = linspace(a, b, n);
% u = deval(sol, x);
% u = u(1, :)';

[x, u] = bvp([c1; c2; c3], [a, b], [u_g, u_b], f, 10);

figure(1)

plot(x, u, 'ro');
xlabel('x');
ylabel('u');
title('e33lo')

% Assignment solution:
[x, u] = bvp([c1; c2; c3], [a, b], [u_g, u_b], f, 100);

figure(2)

plot(x, u, 'r.', 'MarkerSize', 8);
xlabel('x');
ylabel('u');
title('e33lo')
