% Run this line (once per session) if there are import errors:
% cd 'NE-217/lab-1/Lab 1'

% From example one (slide 90)
[x,u] = bvp([1 3 2]', [0,1], [4,5], @(x) 0 * x, 9);

figure(1)

plot(x,u,'o-');
xlabel('x');
ylabel('u');
title('n4du, e33lo, ylepage, jteeter') 

[x,u] = bvp([1; 3; 2], [0, 1], [4, 5], @g2, 9);

figure(2)

plot(x,u,'o-');
xlabel('x');
ylabel('u');
title('n4du, e33lo, ylepage, jteeter') 