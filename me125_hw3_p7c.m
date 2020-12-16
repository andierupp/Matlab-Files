%plot Dw/D vs. x/D

x = linspace(1,20,100);
%park model
D2 = 3.6;
k = 0.06;
Dw = D2+2*k*x;

plot(x,Dw)

hold on

%revised park model
kr = 0.028;
D2 = 3.6;
Dwr = D2+2*kr*x;

plot(x,Dwr)
hold on
%entrainment model

x1 = linspace(1,20,100);
E = 0.13;
x0 = (((1-2*a).^(3/2)*(1-a).^.5)/(6*E*2*a))/3.6;
X = ((6*E)/((2*a*(1-a)).^.5))*(x1-x0);
a = 0.276;

%DwE = ((2*a(1-a)).^.5)*(X.^(2/3)+1)./(X.^(1/3))
DwE = zeros(1,length(X));
for i = 1:length(X)
    DwE(i) = (2*a*(1-a))^(0.5)*(X(i)^(2/3)+1)/(X(i)^(1/3));
end
l = length(x)
L = length(DwE)
plot(x,DwE)
title('Wake Models')
xlabel('Dw(x)/D')
ylabel('x/D')

