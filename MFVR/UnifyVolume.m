function [unifiedVolume, N] = UnifyVolume(volume, NX, NY, NZ)

% Check if the volume is already unified volume 
if (NX == NY && NY == NZ)
    unifiedVolume = volume;
    N = NX;
    return 
end
% Find the largest dimension adnd assign it to N
if (NX > NY)
    N = NX;
else
    N = NY;
end
if (N < NZ)
    N = NZ;
end

% Calculate the offsets in the three dimensions 
xOffset = (N - NX) / 2;
yOffset = (N - NY) / 2;
zOffset = (N - NZ) / 2;

% Allocate the unified volume 
unifiedVolume = zeros (N, N, N);

% Center the input volume in the unified one
for ii = 1:1:NX
    for jj = 1:1:NY
        for kk = 1:1:NZ
            unifiedVolume(ii + xOffset, jj + yOffset, kk + zOffset) = ...
                                                        volume(ii, jj, kk);
        end 
    end 
end

end