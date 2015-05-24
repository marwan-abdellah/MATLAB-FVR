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
