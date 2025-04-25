function [x,m,res]=GaussSeidel2(x,A,B,maxit,toll,omega)
res=sum(abs(B-A*x))/sum(abs(diag(A).*x));
m=0;

while (res>toll & m<maxit)
    m=m+1;
    for i=1:numel(x)
        x(i)=x(i)+omega*(B(i)/A(i,i)-A(i,:)/A(i,i)*x);
    end
    res(m)=sum(abs(B-A*x))/sum(abs(diag(A).*x));
end