%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 1a
%
%Run image "proj5.gif" through a 3x3 median filter and a 3x3 mean
%filter
%
%Thomas Williams
%12/04/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%read image properly
[f_proj, map_proj] = imread("proj5.gif");
imwrite(f_proj, map_proj, "f0.gif");
[M,N] = size(f_proj);

%x-axis for histograms
for i = 1:256         
    xaxis(i) = i - 1;
end

%filter image
f_proj_med = medfilt2(f_proj, [3 3]);
f_proj_3x3 = meanfilter(f_proj,M,N);

figure(1);imshow(f_proj, map_proj)
f_proj_hist = hist(f_proj);
figure(2);plot(xaxis,f_proj_hist)

figure(3);imshow(f_proj_med, map_proj)
f_proj_med_hist = hist(f_proj_med);
figure(4);plot(xaxis,f_proj_med_hist)

figure(5);imshow(f_proj_3x3, map_proj)
f_proj_3x3_hist = hist(f_proj_3x3);
figure(6);plot(xaxis,f_proj_3x3_hist)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 1b
%
%Run image "wheelpepper.gif" through a 3x3 median filter and a 3x3 mean
%filter
%
%Thomas Williams
%12/04/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%read image properly
[f_wheel, map_wheel] = imread("wheelpepper.gif");
imwrite(f_wheel, map_wheel, "f_new.gif");
[V,B] = size(f_wheel);

%filter image
f_wheel_med = medfilt2(f_wheel, [3 3]);
f_wheel_3x3 = meanfilter(f_wheel,V,B);

figure(7);imshow(f_wheel, map_wheel)
f_wheel_hist = hist(f_wheel);
figure(8);plot(xaxis, f_wheel_hist)

figure(9);imshow(f_wheel_med, map_wheel)
f_wheel_med_hist = hist(f_wheel_med);
figure(10);plot(xaxis, f_wheel_med_hist)

figure(11);imshow(f_wheel_3x3, map_wheel)
f_wheel_3x3_hist = hist(f_wheel_3x3);
figure(12);plot(xaxis, f_wheel_3x3_hist)

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
imtool(f1,[]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part2 b
%
%Reducing corruptions and detect tall letters
%
%Ruike Tang
%12/04/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filter1 = ones(45,1); %define filters needed
filter2 = ones(3,3);

f1 = erode(f1,filter2);    %reducing corruptions
f1 = dilate(f1, filter2);
for i = 1:3
   f1 = dilate(f1,[1 1]);
end

for i = 1:3
    f1 = erode(f1,[1 1]);
end

imtool(f1,[]) %display cleaned up image

f2 = erode(f1,filter1); %marking tall letters

f3 = dilate(f2,filter2).*f1; %reconstruction
imtool(f3,[])

for i = 1:65
    f3 = dilate(f3,filter2).*f1;
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
%Part2 C
%
%Edge Detection
%
%Vladimir Shluahrchuk
%12/04/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f4 = erode(f3,filter2) + dilate(f3, filter2);

for x = 1:X %unfill the inside of the letters
    for y = 1:Y
        if f4(x,y) == 0
            f4(x,y) = 2;
        end
    end
end

imtool(f4,[])