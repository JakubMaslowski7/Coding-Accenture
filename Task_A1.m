%Task A, Jakub Maslowski, egyjm6@nottingham.ac.uk

clear all; close all; clc; %clears workspace, figures, command window

%input parameters
L=0.5; n=51;
lambda=100;
qa=5000; Tb=350;
Sc=10; Sp=-160; %Source Term S=Sc+Sp*T

%Generate Grid
x0=linspace(0,L,n); dx=L/(n-1);   % x0:nodes position
Dx=dx; DxB=Dx/2;  

%Creating Matrix
A=zeros(n,n); B=zeros(n,1); %Fill Matrix with zeros

A(1,1)=(lambda/dx)-(Sp*DxB); A(1,2)=-lambda/dx; B(1)=(Sc*DxB)+qa; % Node 1
A(n,n)=1; B(n)=Tb; % Node n

%Fill A and B%
for i=2:n-1
    A(i,i)=(2*lambda/dx)-(Sp*Dx); A(i,i-1)=-lambda/dx; A(i,i+1)=-lambda/dx;
    B(i)=Sc*Dx;
end

T=A\B; %Backslash
figure('color','w','units','Centimeters','position',[5 5 7.5 7])
plot(x0,T,'rs'); grid on; xlabel('x [m]'); ylabel('T [K]'); hold on;

%Compare with theoretical solution
mu1=sqrt(abs(Sp)/lambda); mu2=-sqrt(abs(Sp)/lambda);
c1=(Tb+(qa/(lambda*mu2))*exp(mu2*L)+(Sc/Sp))/(exp(mu1*L)-(mu1/mu2)*exp(mu2*L))
c2=((-qa/lambda)-(c1*mu1))/(mu2)
Tteo=c1*exp(mu1*x0)+c2*exp(mu2*x0)-Sc/Sp;
plot(x0,Tteo,'k-'); legend('Backslash','Exact');
error=mean(abs(T-Tteo')) %Transposing Tteo

%To check for convergence, we need to repeat the simulation for different
%values of n

n=[11 21 51 101 201 501 1001];

for j=1:numel(n)
    x0=linspace(0,L,n(j));
    dx=L/(n(j)-1); Dx=dx; DxB=Dx/2
    A=zeros(n(j),n(j)); B=zeros(n(j),1);
    A(1,1)=(lambda/dx)-(Sp*DxB);
    A(1,2)=-lambda/dx;
    B(1)=(Sc*DxB)+qa;
    A(n(j),n(j))=1; B(n(j))=Tb;
    for i=2:n(j)-1
        A(i,i-1)=-lambda/dx; A(i,i)=(2*lambda/dx)-(Sp*Dx); A(i,i+1)=-lambda/dx;
        B(i)=Sc*Dx;
    end
    T=A\B %Backslash
    figure(j)
    plot(x0,T,'rs'); grid on; xlabel('x [m]'); ylabel('T [K]'); hold on
    %Theoretical Solution
    Tteo=c1*exp(mu1*x0)+c2*exp(mu2*x0)-Sc/Sp;
    plot(x0,Tteo,'k-'); legend('Backslash','Exact'); title(['n=',num2str(n(j))]);
    error(j)=mean(abs(T-Tteo'));

end

dx=L./(n-1);
figure('color','w','units','Centimeters','position',[5 5 7.5 7])
loglog(dx,error,'o-'); grid on;
xlabel('\deltax [m]'); ylabel('mean(|T-T_{teo}|) [K]')




