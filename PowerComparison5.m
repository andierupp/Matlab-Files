%{
 
Macdonald model 5
Array: square
Frontal area index: 0.16

%}


uH = 1; % check agreement
us = 0.23;
H = 4; 
a = 1.32; % figure out how this is calculated/check agreement
kappa = 0.40;
z1 = 0:0.001:H;

d = 0.32*H; % I think this is determined experimentally?
lc = 0.14*H; % no idea 
z0 = 0.084*H; % compare to class values

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


%HAWT Power

cp = 0.4;
rho = 1.23;
r= 5;
d = 2*r;
p1 = cp*rho*0.5*u1.^3*(pi/4)*d^2;
p2 = cp*rho*0.5*u2.^3*(pi/4)*d^2;
p3 = cp*rho*0.5*u3.^3*(pi/4)*d^2;

pl1 = plot(u1,p1,'r');
hold on
pl2 = plot(u2,p2,'r');
hold on
pl3 = plot(u3,p3,'r');
hold on

%VAWT power
cp1 = 0.31;
h = 7.85;
pv1 = .5*rho*u1.^3*2*r*h*cp1;
pv2 = .5*rho*u2.^3*2*r*h*cp1;
pv3 = .5*rho*u3.^3*2*r*h*cp1;

pl4 =  plot(u1,pv1,'b');
hold on
pl5 = plot(u2,pv2,'b');
hold on
pl6 = plot(u3,pv3,'b');
hold on

legend([pl1, pl4],{'HAWT', 'VAWT'})
xlabel('Wind Velocity (m/s)')
ylabel('Power (W)')