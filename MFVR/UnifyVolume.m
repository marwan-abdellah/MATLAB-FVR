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
