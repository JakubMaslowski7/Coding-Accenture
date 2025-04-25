function [x,res,m]=GaussSeidel(A,B,x,tol,maxIter)

n=numel(x);

m=0;
res=sum(abs(B-A*x))/sum(abs(diag(A).*x));

while (res>tol && m<maxIter)
    m=m+1;
    for i=1:n
        total=0;
        for j=1:i-1
        total=total+x(j)*A(i,j);
        end
        for j=i+1:n
         total=total+x(j)*A(i,j);
        end
         x(i)=B(i)/A(i,i)-total/A(i,i);
    end

end

x(i)=B(i)/A(i,i)-A(i,1:i-1)/A(i,i)*x(1:i-1)-A(i,i+1:end)/A(i,i)*x(i+1:end);