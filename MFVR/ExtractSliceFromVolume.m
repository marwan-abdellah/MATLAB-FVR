function [sliceData] = ExtractSliceFromUnifiedVolume(volume, N, rotationAxis, angle)

% Construct the mesh grid for sampling the volume 
meshN = -(N / 2):1:(N / 2) - 1;
[x, y, z] = meshgrid(meshN, meshN, meshN);

% Build a surface with size equal to the final slice size
% NOTE: This function assumes a unified volume. 
sliceExtent = linspace(-N / 2, N / 2 , N);
slicePlane = surf(sliceExtent, sliceExtent, ...
    zeros((sliceWidth), (sliceHeight)));

% Adjust the rotation of the slice through the volume. 
% By defult, it assumes a Y-axis rotation
if (rotationAxis == 'X')
    rotate(slicePlane, [1,0,0], angle);
elseif (rotationAxis == 'Y')
    rotate(slicePlane, [0,1,0], angle);
elseif (rotationAxis == 'Z')
    rotate(slicePlane, [0,0,1], angle);
else
    rotate(slicePlane, [0,1,0], angle);
end

% Get the slice indexes.
xData =  get(slicePlane,'XData');
yData =  get(slicePlane,'YData');
zData =  get(slicePlane,'ZData');

% Free the slice plane 
delete(slicePlane); 

% Return the intersection between the volume and the slice after the
% interpolation.
sliceHdl = slice(x, y, z, volume, xData, yData, zData);
sliceData = get(sliceHdl, 'CData');

% Remove all the nan's/
sliceData(isnan(sliceData)) = 0;

end