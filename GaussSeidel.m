function [x,m,res]=GaussSeidel(x,A,B,maxit,toll)
res=sum(abs(B-A*x))/sum(abs(diag(A).*x));
m=0;

while (res>toll & m<maxit)
    m=m+1;
    for i=1:numel(x)
        x(i)=x(i)+(B(i)/A(i,i)-A(i,:)/A(i,i)*x);
    end
    res(m)=sum(abs(B-A*x))/sum(abs(diag(A).*x));
end

