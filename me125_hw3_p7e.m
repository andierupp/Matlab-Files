%momentum deficit

%park model
x = linspace(1,20,100)/3.6;
D2 = 3.6;
k = 0.06;
V0 = 10;
rho = 1.23;
Vw = (1 - ((2*a)./((1+2*k*a.*x).^2)))*V0;
Dw = D2+2*k.*x;
%M = rho*pi*Dw.^2*VwE*(V0-Vw)/4;

M = zeros(1,length(X));
for i = 1:length(X)
    M = rho*pi*Dw.^2.*Vw.*(V0-Vw)/4;
end

plot(x,M)
hold on

%revised park model

kr = 0.028
VwP = .5*(1+(1-(8*a*(1-2*a))./(1+2*kr*x).^2).^.5)*V0;
Mrp = rho*pi*Dw.^2.*VwP.*(V0-Vw)/4
plot(x,Mrp)
hold on

%entrainment model
x1 = linspace(1,20,100);
E = 0.13
x0 = (((1-2*a).^(3/2)*(1-a).^.5)/(6*E*2*a))/3.6
X = ((6*E)/((2*a*(1-a)).^.5))*(x1-x0)
VwE = (X.^(2/3))./(X.^(2/3)+1)

ME =  rho*pi*Dw.^2.*VwE.*(V0-Vw)/4
plot(x,ME)
hold on
title('Momentum Deficit')
xlabel('x/D')
ylabel('Mdef')
%thrust
Ct = 0.8;
T = Ct*.5*rho*V0^2;
yline(T)


V0 = 10;
D = 100;
kP = 0.06;
kRP = 0.028;
E = 0.13;
Ct = 0.8;
a = (1-sqrt(1-Ct))/2; rho = 1.23;
x_norm = 20;
D2_norm = ((1-a)*(1-2*a))^(1/2);
D_P_norm = D2_norm+2*kP.*x_norm;
D_P = D_P_norm*D;
V_P_norm = 1-2*a./(1+2*kP.*x_norm/D2_norm).^2; V_P = V_P_norm*D;
D_RP_norm = D2_norm+2*kRP*x_norm;
D_RP = D_RP_norm*D;
V_RP_norm = 1/2*(1+(1-8*a*(1-2*a)./(1+2*kRP.*x_norm/D2_norm).^2).^(1/2));
V_RP = V_RP_norm*D;
x0_norm = -1/(6*E)*(1-2*a)^(3/2)*(1-a)^(1/2)/(2*a);
X = 6*E/(2*a*(1-a))^(1/2)*(x_norm-x0_norm);
D_E_norm = (2*a*(1-a))^(1/2).*(X.^(2/3)+1)./X.^(1/3);
D_E = D*D_E_norm;
V_E_norm = X.^(2/3)./(X.^(2/3)+1); 
V_E = V_E_norm*D;
A_P = pi*D_P^2/4; A_RP = pi*D_RP^2/4;
A_E = pi*D_E^2/4;
power_P = 1/2*rho*V_P^3*A_P; 
power_RP = 1/2*rho*V_RP^3*A_RP; 
power_E = 1/2*rho*V_E^3*A_E;
