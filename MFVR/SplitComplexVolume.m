function [realPart, imagPart] = SplitComplexVolume(complexVolume, ...
    NX, NY, NZ)

% Allocation 
realPart = zeros (NX , NY, NZ); 
imagPart = zeros (NX , NY, NZ);

% Splitting 
for ii = 1:1:NX
    for jj = 1:1:NY
        for kk = 1:1:NZ
            realPart(ii, jj, kk) = real(complexVolume(ii, jj, kk));
            imagPart(ii, jj, kk) = imag(complexVolume(ii, jj, kk));
        end 
    end 
end

end 