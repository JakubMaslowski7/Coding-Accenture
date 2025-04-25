%Task C

clear all; close all; clc; %clears workspace, figures, command window

%functions
%u(x,y,z)=x*exp(y)+z+1
%v(x,y,z)=y*z-x^3-pi
%w(x,y,z)=x*y^2*z-3.7

maxIt=1000; tol=1e-8 %max iterations and tolerance
x=1; y=3; z=5; %initial guesses

err=sum(abs(x*(exp(y)+z+1)))+sum(abs(y*z-x^3-pi))+sum(abs(x*y^2*z-3.7));
%error=err=|u|+|v|+|w|

i=1;
while err(i)>tol & i<maxIt
    J(1,1)=exp(y(i)); % du/dx
    J(1,2)=x(i)*exp(y(i)); % du/dy
    J(1,3)=1; %du/dz
    J(2,1)=-1*(3*x(i)^2); %dv/dx
    J(2,2)=z(i); % dv/dy
    J(2,3)=y(i); % dv/dz
    J(3,1)=y(i)^2*z(i); % dw/dx
    J(3,2)=2*x(i)*y(i)*z(i); % dw/dy
    J(3,3)=x(i)*y(i)^2; % dw/dz
    F(1,1)=x(i)*exp(y(i))+z(i)+1;
    F(2,1)=y(i)*z(i)-x(i)^3-pi;
    F(3,1)=x(i)*y(i)^2*z(i);
    X(1,1)=x(i);
    X(2,1)=y(i);
    X(3,1)=z(i);

    X=J\(-F+J*X); % Backslash operator to solve the linear system
    x(i+1)=X(1); y(i+1)=X(2); z(i+1)=X(3); % New guess values

    F(1)=x(i+1)*exp(y(i+1))+z(i+1)+1; % Needed to compute new error
    F(2)=y(i+1)*z(i+1)-x(i+1)^3-pi; % Needed to compute new error
    F(3)=x(i+1)*y(i+1)^2*z(i+1); % Needed to compute new error

    err(i+1)=sum(abs(F));
    i=i+1;
end

figure('color','w','units','Centimeters','position',[5 5 7.5 7]);
plot(x,'o-'); hold on; plot(y,'o-'); hold on; plot(z,'o-')
grid on; xlabel('Iterations'); ylabel('Solutions'); legend('x','y');
figure('color','w'); semilogy(err,'o-'); grid on
xlabel('Iterations'); ylabel('Error: |F(x)|')

  