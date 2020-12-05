%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%erode function
%
%Ruike Tang
%12/04/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function output = erode(A,B)
A=double(A); %convert input to double


[X,Y] = size(A); %get the sizes for both the image and the filter
[H,I] = size(B);

A(X+1:X+H,Y+1:Y+I) = zeros(H,I); %zero padding


for x = 1:X %move through the whole image
    for y =1:Y
        if sum(sum(A(x:x+H-1,y:y+I-1).*B)) == H*I; %if all pixel intersect, set the first pixel location of the filter to 1
            A(x,y) = 1;
        else
            A(x,y) = 0; %otherwise set 0
        end
    end
end
A = A(1:X,1:Y); %delete padded area
C = zeros(X,Y);
C(1:X,I+1:Y) = A(1:X,1:Y-I); %shift the dilated image
output = C;
