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
