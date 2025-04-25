%Task B

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
%plot(x0,T,'rs'); grid on; xlabel('x [m]'); ylabel('T [K]'); hold on

%Compare with theoretical solution
mu1=sqrt(abs(Sp)/lambda); mu2=-sqrt(abs(Sp)/lambda);
c1=(Tb+(qa/(lambda*mu2))*exp(mu2*L)+(Sc/Sp))/(exp(mu1*L)-(mu1/mu2)*exp(mu2*L))
c2=((-qa/lambda)-(c1*mu1))/(mu2)
Tteo=c1*exp(mu1*x0)+c2*exp(mu2*x0)-Sc/Sp;
plot(x0,Tteo,'k-'); 
error=mean(abs(T-Tteo')) %Transposing Tteo

%TASK 2

%Checking residuals
residual=sum(abs(B-A*T))/sum(abs(diag(A).*T)) %Defined as |B-A*T|/|diag(A).T|

%Gauss Seidel
maxit=100000; %max number of iterations allowed
toll=1e-12; %convergence tolerance WORK OUT OWN FROM TASK 1?
T0=350*ones(n,1) %Initial guess

omega=2
[T_gaussSeidel,nIter,residuals_gaussSeidel]=GaussSeidel2(T0,A,B,maxit,toll,omega); %GS as function
hold on; plot(x0,T_gaussSeidel,'mv');


error_gaussSeidel=mean(abs(T_gaussSeidel-Tteo))
residuals_gaussSeidel(nIter)
figure('color','w','units','Centimeters','position',[5 5 7.5 7])
semilogy(residuals_gaussSeidel); grid on; xlabel('Iterations'); ylabel('Residuals')