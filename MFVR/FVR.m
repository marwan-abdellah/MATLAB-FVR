clear all; 
close all;
clc;

% Loading the volume data from the RAW file 
dataPath = '/Software/mFVR/CTData/CTData';
[volumeData, NX, NY, NZ] = LoadDataSet(dataPath); 

% Convert the data to a 3D distribution and free the volumeData
volume = ConvertDataTo_3D_Volume(volumeData, NX, NY, NZ);
clear volumeData;

% Unify the volume 
[volume, N] = UnifyVolume(volume, NX, NY, NZ);

% 3D FFT-shift for the spatial volume
volume = fftshift(volume);

% Compute the 3D Spectrum 
spectrum = fft3(volume); 

% Do a fft shift 
spectrum = fftshift(spectrum);

% Split the volume to the two components real and imaginary, and fine the
% projection slice for every component.
[realVolume, imagVolume] = SplitComplexVolume(spectrum, N, N, N);

pivot = 'X';
for angle = 0:1:90

    % Extract the projection slice 
    projectionSlice = ExtractProjectionSliceFromUnifiedVolume ... 
                                (realVolume, imagVolume, N, pivot, angle);

    % Backtransforming the slice to the spatial domain to yield the 
    % projection followed by 2D FFT-shift for the projection. 
    projection = fftshift(abs(ifft2(((projectionSlice)))));
    
    figure(1);
    
    
    figure(2);
    imshow((projection) * 1e-4);

end
