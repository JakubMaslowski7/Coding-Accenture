%Jakub Maslowski egyjm6@nottingham.ac.uk
clear

prompt = ('What is the height of the box?\n');
h = input(prompt,'s');

prompt = ('What is the width of the box?\n');
w = input(prompt,'s');

prompt = ('What is the breadth of the box?\n');
b = input(prompt,'s');

dimensions=sprintf('your box has dimensions height=%s, width=%s, breadth=%s',h,w,b);
disp(dimensions);

function ret=box_area(h,w,b)
ret=(2*b*h)+(2*b*w)+(2*h*w);
end

function ret=box_volume(h,w,b)
ret=(h*w*b)
end

area_volume=sprintf('The box has the area of %2d and volume of %2d',box_area,box_volume);
disp(area_volume);

