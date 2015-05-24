function [image] = FVR_RenderingLoop ...
                                (realVolume, imagVolume, N, pivot, angle)

% Extract the projection slice 
projectionSlice = ExtractProjectionSliceFromUnifiedVolume ... 
                            (realVolume, imagVolume, N, pivot, angle);

% Backtransforming the slice to the spatial domain to yield the 
% projection followed by 2D FFT-shift for the projection. 
image = fftshift(abs(ifft2(((projectionSlice)))));

end