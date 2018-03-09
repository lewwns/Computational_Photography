a = imread('hw3/7.jpg');
a = imresize(a,[1024,768]);
a = im2double(a);
noflash = rgb2gray(a);
denoised_noflash = bilateralFilter( noflash, 16, 0.05);

im = im2uint8(denoised_noflash);
%figure; imshow(im);


b = imread('hw3/8.jpg');
b = imresize(b,[1024,768]);
b = im2double(b);
flash = rgb2gray(b);
denoised_flash = bilateralFilter( flash, 16, 0.05);

im = im2uint8(denoised_flash);
%figure; imshow(im);



fused = denoised_noflash .* ((flash + 0.2) ./ (denoised_flash + 0.2));


fused_im = im2uint8(fused);
figure; imshow(fused);

