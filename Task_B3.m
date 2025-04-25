%Compare with theoretical solution
mu1=sqrt(abs(Sp)/lambda); mu2=-sqrt(abs(Sp)/lambda);
c1=(Tb+(qa/(lambda*mu2))*exp(mu2*L)+(Sc/Sp))/(exp(mu1*L)-(mu1/mu2)*exp(mu2*L))
c2=((-qa/lambda)-(c1*mu1))/(mu2)
Tteo=c1*exp(mu1*x0)+c2*exp(mu2*x0)-Sc/Sp;
plot(x0,Tteo,'k-'); legend('Backslash','Exact')
error=mean(abs(T-Tteo')) %Transposing Tteo

%Checking residuals
residual=sum(abs(B-A*T))/sum(abs(diag(A).*T)) %Defined as |B-A*T|/|diag(A).T|

%Gauss Seidel
maxit=100000; %max number of iterations allowed
toll=1e-12; %convergence tolerance WORK OUT OWN FROM TASK 1?
T0=350*ones(n,1) %Initial guess
[T_gaussSeidel,nIter,residuals_gaussSeidel]=GaussSeidel(T0,A,B,maxit,toll); %GS as function
hold on; plot(x0,T_gaussSeidel,'mv'); legend('Backslash','Exact','Gauss-Seidel')

error_gaussSeidel=mean(abs(T_gaussSeidel-Tteo'))
residuals_gaussSeidel(nIter)
figure('color','w','units','Centimeters','position',[5 5 7.5 7])
semilogy(residuals_gaussSeidel); grid on; xlabel('Iterations'); ylabel('Residuals')