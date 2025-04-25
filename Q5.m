%Jakub Maslowski egyjm6@nottingham.ac.uk
clear

tic
a=imread("museum_london.jpg")
imshow(a)

L=a;
D=a;

len=size(a)

x_len=len(1)
y_len=len(2)

for x=1:x_len
    for y=1:y_len
        L(x,y)=a(x,y)*1.5;
        D(x,y)=a(x,y)*0.3;
        B=sprintf('The brightness of the pixel at %d,%d is %d',x,y,a(x,y));
   
      
   
    end
    
end
figure=imshow(L)
toc

