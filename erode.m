function output = erode(A,B)
A=double(A);
%B = ones(5,5);

[X,Y] = size(A);
[H,I] = size(B);

A(X+1:X+H,Y+1:Y+I) = zeros(H,I);


for x = 1:X
    for y =1:Y
        if sum(sum(A(x:x+H-1,y:y+I-1).*B)) == H*I;
            A(x,y) = 1;
        else
            A(x,y) = 0;
        end
    end
end
A = A(1:X,1:Y);
C = zeros(X,Y);
C(1:X,I+1:Y) = A(1:X,1:Y-I);
output = C;
