% From example one (slide 90)
[x,u] = bvp([1 3 2]', [0,1], [4,5], @g1, 9);

plot(x,u,'o-');
%hold on
%xs = linspace(0,1,100);
%plot(xs, u2(xs), 'r')