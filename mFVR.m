clear all; 
close all;
clc;

% Volume Dimensions 
volWidth = 256;
volHeight = 256; 
volDepth = 256; 

% 3D size 
volSize = volWidth * volHeight * volDepth; 

% Read binary file that contain 1-byte data (fopen)
% fId is the identifier 
% Use full path to avoid invalid identifiers.
[fId, outMessage] = fopen('CTData.img');

% Read the data from the file into the array
volumeData_1D = fread(fId, 'uchar','b');

% Validating data 
dataSize = size(volumeData_1D);

% Convert it to a volume 
% Rearrange the data from 1D array into 3D array for easy access
volumeData_3D = zeros (volWidth, volHeight, volDepth); 

% 1D iterator 
it = 1;
for ii = 1:1:volWidth
    for jj = 1:1:volHeight
        for kk = 1:1:volDepth 
            volumeData_3D(ii, jj, kk) = volumeData_1D(it); 
            it = it + 1; 
        end 
    end 
end

volumeData_3D = fftshift(volumeData_3D);

% Compute the 3D Spectrum 
spectralVolume = fft(fft(fft(volumeData_3D,[],1),[],2),[],3);

% Do a fft shift 
spectralVolume = fftshift(spectralVolume);

spectralVolume_Real = zeros(volWidth, volHeight, volDepth);
spectralVolume_Imag = zeros(volWidth, volHeight, volDepth);

for ii = 1:1:volWidth
    for jj = 1:1:volHeight
        for kk = 1:1:volDepth 
            spectralVolume_Real(ii, jj, kk) = real(spectralVolume(ii, jj, kk));
            spectralVolume_Imag(ii, jj, kk) = imag(spectralVolume(ii, jj, kk));
        end 
    end 
end

% Slice dimensions 
sliceWidth = 256; 
sliceHeight = 256;
angle = 45;
%for angle = 0:5:90

% Slice extent 
% It goes from 1 to sliceWidth and 1 to sliceHeight

[x, y, z] = meshgrid(-128:1:127,-128:1:127,-128:1:127);

slicePlane_R = surf(linspace(-sliceWidth / 2, sliceWidth / 2 , sliceWidth), ... 
    linspace(-sliceHeight / 2, sliceHeight / 2, sliceHeight), ...
    zeros((sliceWidth), (sliceHeight)));

rotate(slicePlane_R, [1,0,0], angle);

xd_R = get(slicePlane_R,'XData');
yd_R = get(slicePlane_R,'YData');
zd_R = get(slicePlane_R,'ZData');

delete(slicePlane_R); 

hSlice_R = slice(x, y, z, spectralVolume_Real, xd_R, yd_R, zd_R);

sliceData_R = get(hSlice_R, 'CData');
sliceData_R(isnan(sliceData_R)) = 0;

slicePlane_I = surf(linspace(-sliceWidth / 2, sliceWidth / 2 , sliceWidth), ... 
    linspace(-sliceHeight / 2, sliceHeight / 2, sliceHeight), ...
    zeros((sliceWidth), (sliceHeight)));

rotate(slicePlane_I, [1,0,0], angle);

xd_I = get(slicePlane_I,'XData');
yd_I = get(slicePlane_I,'YData');
zd_I = get(slicePlane_I,'ZData');

delete(slicePlane_I); 

hSlice_I = slice(x, y, z, spectralVolume_Imag, xd_I, yd_I, zd_I);

sliceData_I = get(hSlice_I, 'CData');
sliceData_I(isnan(sliceData_I)) = 0;

% Construct the final slice 
sliceData_Complex = zeros(sliceWidth, sliceHeight);
for ii = 1:1:sliceWidth
    for jj = 1:1:sliceHeight
        sliceData_Complex(ii,jj) = (sliceData_R(ii, jj)) + (sliceData_I(ii, jj))* 1i;
    end
end

recImage = fftshift(abs(ifft2(((sliceData_Complex)))));

figure;
imagesc((recImage));
color(gray);

%end