%{
Macdonald model 1
Array: square
Frontal area index: 0.05

%}


uH = 1.38; % check agreement
us = 0.20;
H = 4; 
a = 0.63; % figure out how this is calculated/check agreement
kappa = 0.40;
z1 = 0:0.001:H;

d = 0.066*H; % I think this is determined experimentally?
lc = 0.21*H; % no idea 
z0 = 0.048*H; % compare to class values

syms zw;
A = lc - (H/(zw-H))*(kappa*(zw-d)-lc);
B = (1/(zw-H))*(kappa*(zw-d)-lc);
eqn = us/B*log((A+B*zw)/(A+B*H))+uH == us/kappa*log((zw-d)/z0);
S = vpasolve(eqn,zw);
A = subs(A,zw,S);
B = subs(B,zw,S);
zw = double(S);

z2 = H:0.001:zw;

z3 = zw:0.001:16;

u1 = uH*exp(a*(z1/H-1));

u2 = us/B*log((A+B*z2)/(A+B*H))+uH;

u3 = us/kappa*log((z3-d)/z0);

plot(u1,z1,'b');
hold on;
plot(u2,z2,'b');
hold on;
plot(u3,z3,'b');