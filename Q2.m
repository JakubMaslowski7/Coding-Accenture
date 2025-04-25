%Jakub Maslowski egyjm6@nottingham.ac.uk
clear

prompt = ('Hi, what is your name?\n');       %The program will ask for your name which you have to type in the command window
user_name = input(prompt,'s');

str=user_name                                %The program will now make a string array of the name and convert it to the ASCII numbers
double(str)

str2='Computers store all data as numbers'   %Answer in ASCII code: 67   111   109   112   117   116   101   114   115    32   115   116   111   114   101    32  97   108   108    32   100    97   116    97    32    97   115    32   110   117   109   98   101   114   115
double(str2)                                