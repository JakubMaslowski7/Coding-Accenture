%Jakub Maslowski egyjm6@nottingham.ac.uk
clear

a = [ 0 0 1 ; 0 1 0 ; 0 0 1 ]         %Part a, writing 2 matrices into matlab
b = [ 1 0 0 ; 0 1 0 ; 1 0 0 ]

B=a+b                                 %Part b, adding matrix a and b together

C=b-a                                 %Part c, subtracting matrix a from matrix b

D=a*b                                 %Part d, multiplying matrix a and b

e=a+4                                 %Part e, adding 4 to each element in matrix a

Z=randi([-10,10],10,10)               %Part f, generated and plotted a random 10x10 matrix between the values of -10 and 10
surf(Z)

det(Z)                                %Part g, found the determinant of Z






