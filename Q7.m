%Jakub Maslowski egyjm6@nottingham.ac.uk
clear

a=zeros(8,8)
a(3,3)=1

imagesc(a)

len=size(a)

x_len=8
y_len=8
for x=1:x_len
    for y=1:y_len
        a(y,x)=1
        g=sprintf('At the value x=%f, y=%f the value of a=%f',x,y,a(y,x));
        if a(y,x)==1
            h=sprintf('A gas particle exists at x=%f, y=%f',a(x),a(y));      
            disp(h)
        end
        disp(g)
    end
end         %this uses iteration to go over each value in the array and changes it to 1




