%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Copyright (c) 2014 Marwan Abdellah <marwan.m.abdellah@ieee.org>
% 
%    This file is part of MFVR.
%
%    MFVR is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    Foobar is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
