% Question 1.8b
I = 17;  

n = 50 + I; 

%bvp1 

[x1, u1] = bvp([1; 3; 2], [0, 1], [4, 5], @(x) 0 * x, n); 

 

figure(1) 

plot(x1, u1, 'r.', 'MarkerSize', 12) 

xlabel('x') 

ylabel('u') 

title('n4du and e33lo')

%bvp2 

[x2, u2] = bvp([1; 3; 2], [0, 1], [4, 5], @g2, n); 

 

figure(2) 

plot(x2, u2, 'r.', 'MarkerSize', 12) 

xlabel('x') 

ylabel('u') 

title('n4du and e33lo') 