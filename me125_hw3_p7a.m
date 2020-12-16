%park model

x = (1:100)/3.6;
a = 0.276;
k=.06;
%D2 = 3.6
%D2 = (1-a)/(1-2*a))^.5;
%D_w = D*((1-a)/(1-2*a))^.5;
Vw = 1 - ((2*a)./((1+2*k*a*x).^2));
%xD = (1/(2*k))*((D_w/D) - (D2/D));

%revised Park model
kr = 0.028
VwP = .5*(1+(1-(8*a*(1-2*a))./(1+2*kr*x).^2).^.5);

%Entrainment model
x1 = linspace(1,100,100)
E = 0.13
x0 = (((1-2*a).^(3/2)*(1-a).^.5)/(6*E*2*a))/3.6
X = ((6*E)/((2*a*(1-a)).^.5))*(x1-x0)
VwE = (X.^(2/3))./(X.^(2/3)+1)



%plot(x,Vw)
title('Wake Models')
xlabel('x/D')
ylabel('Vw(x)/V0')
hold on 

%plot(x,VwP)

hold on 

%plot(x1,VwE)
hold on 
v0 = ones(1, 20)
%plot(x, 0.9*v0, 'bo')

kP = 0.06;
kRP = 0.028;
E = 0.13;
Ct = 0.8;
a = (1-sqrt(1-Ct))/2;
x_norm = 1:0.01:30;
D2_norm = ((1-a)*(1-2*a))^(1/2);
D_P = D2_norm+2*kP.*x_norm;
V_P = 1-2*a./(1+2*kP.*x_norm/D2_norm).^2;
D_RP = D2_norm+2*kRP*x_norm;
V_RP = 1/2*(1+(1-8*a*(1-2*a)./(1+2*kRP.*x_norm/D2_norm).^2).^(1/2));
x0_norm = -1/(6*E)*(1-2*a)^(3/2)*(1-a)^(1/2)/(2*a); X = 6*E/(2*a*(1-a))^(1/2)*(x_norm-x0_norm);
D_E = (2*a*(1-a))^(1/2).*(X.^(2/3)+1)./X.^(1/3); V_E = X.^(2/3)./(X.^(2/3)+1);

plot(x_norm,V_P); 
hold on;
plot(x_norm,V_RP); 
plot(x_norm,V_E);


yline(.9)

