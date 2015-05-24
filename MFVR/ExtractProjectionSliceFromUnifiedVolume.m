function [complexSlice] = ExtractProjectionSliceFromUnifiedVolume ... 
                          (realVolume, imagVolume, N, rotationAxis, angle)
                      
realData = ExtractSliceFromUnifiedVolume ...
                                    (realVolume, N, rotationAxis, angle);
imagData = ExtractSliceFromUnifiedVolume ...
                                    (imagVolume, N, rotationAxis, angle);

% Build the complex slice
complexSlice = zeros(N, N);
for ii = 1:1:N
    for jj = 1:1:N
        complexSlice(ii,jj) = (realData(ii, jj)) + (imagData(ii, jj))* 1i;
    end
end

end
