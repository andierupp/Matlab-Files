%power evaluation

%park model
D2 = 3.6;
k = 0.06;
V0 = 10;
rho = 1.23;
x= 20/3.6;
Vw = (1 - ((2*a)/((1+2*k*a*x)^2)))*V0;
Dw = D2+2*k*x;
M = rho*pi*Dw^2*Vw*(V0-Vw)/4


%revised park model
kr = 0.028;
Dw = D2+2*kr.*x;
VwP = .5*(1+(1-(8*a*(1-2*a))/(1+2*kr*x)^2)^.5);
M1 = rho*pi*Dw^2*VwP*(V0-VwP)/4

%entrainment model
x1 = 20;
E = 0.13;
x0 = (((1-2*a)^(3/2)*(1-a)^.5)/(6*E*2*a))/3.6;
X = ((6*E)/((2*a*(1-a))^.5))*(x1-x0);
VwE = (X^(2/3))/(X^(2/3)+1);
DwE = (2*a*(1-a))^(0.5)*(X^(2/3)+1)/(X^(1/3));
M2 = rho*pi*Dw^2*VwE*(V0-VwE)/4
