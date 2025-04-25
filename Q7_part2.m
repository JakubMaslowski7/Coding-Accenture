%Jakub Maslowski egyjm6@nottingham.ac.uk
clear

a=zeros(8,8);

imagesc(a)

len=size(a);

x_len=len(1);
y_len=len(1);

for x=1:x_len
    for y=1:y_len
       if (a(y,x)==1)
           a(x,y)=0;
           show=sprintf('At the value x=%f, y=%f the value of a=%f',x,y,a(y,x));
           
           r=rand(1)*4;  %gives a random numer between 0 and 4
           r=floor(r);   %rounds the number to the nearest whole number
           y_new=y;
           x_new=x;
  
       
          
           if r==0
            y_new=y_new+1;
            %disp('Move particle up')
        elseif r==1
            y_new=y_new-1;
            %disp('Move particle down')
        elseif r==2
            x_new=x_new+1;
            %disp('Move particle right')
        elseif r==3
            x_new=x_new-1;
            %disp('Move particle left')
           end
           
           a(y,x)=0
           a(y_new,x_new)=1
       end
       
    
       
       
    end
   
end
    