function [volume] = ConvertDataTo_3D_Volume(volumeData, NX, NY, NZ)

% Allocate a 3D volume array 
volume = zeros (NX , NY, NZ); 

% 1D iterator 
it = 1;

% Loop over the 1D array elements and convert them into 3D distribution 
for ii = 1:1:NX
    for jj = 1:1:NY
        for kk = 1:1:NZ 
            volume(ii, jj, kk) = volumeData(it); 
            it = it + 1; 
        end 
    end 
end

end 