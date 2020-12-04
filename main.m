clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part2 a
%
%thresholding the original image and turn it into a binary image
%
%Ruike Tang
%12/04/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f1 = imread('proj5.gif'); %read original image
[X,Y] = size(f1); %get size

imtool(f1,[]); %display original

for x = 1:X %thresholding and inverting
    for y = 1:Y
        if f1(x,y) >= 73
            f1(x,y) = 0;
        else
            f1(x,y) = 1;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part2 b
%
%Reducing corruptions and detect tall letters
%
%Ruike Tang
%12/04/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filter1 = ones(45,3); %define filters needed
filter2 = ones(3,3);

f1 = imerode(f1,filter2);    %reducing corruptions
f1 = imdilate(f1, filter2);

for i = 1:3
    f1 = imdilate(f1,[1 1 1]);
end

for i = 1:6
    f1 = imerode(f1,[1 1]);
end

f2 = imerode(f1,filter1); %marking tall letters

f3 = imdilate(f2,filter2).*f1; %reconstruction

for i = 1:65
    f3 = imdilate(f3,filter2).*f1;
end
    
for x = 1:X %inverting the image
    for y = 1:Y
        if f3(x,y) == 0
            f3(x,y) = 1;
        else
            f3(x,y) = 0;
        end
    end
end

imtool(f3,[]) %display processed image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%