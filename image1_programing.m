clear all;
clc;

%Display the image

%read the original text file to a 64*64 matrix
fileID = fopen('charact1.txt');
im1_ori = fscanf(fileID,'%s');
im1_ori = reshape(im1_ori, [64,64]);
im1_ori = im1_ori';
fclose(fileID);

%convert each element from 32 base to dec
for j = 1:64
    for i = 1:64
        im1_ori(i,j) = base2dec(im1_ori(i,j),32);
    end
end

%convert char matrix to num matrix
im1_ori = double(im1_ori);

%display the image
figure('name','original image'), imshow(im1_ori, []);

%thresholding
threshold = 5;
im1_thr= zeros(64);
for j = 1:64
    for i = 1:64
        if im1_ori(i,j) < threshold
            im1_thr(i,j)= 0;
        else
            im1_thr(i,j)= 1;
        end
    end
end
figure('name','thresholding'), imshow(im1_thr,[]);
