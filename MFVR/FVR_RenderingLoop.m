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

function [image] = FVR_RenderingLoop ...
                                (realVolume, imagVolume, N, pivot, angle)

% Extract the projection slice 
projectionSlice = ExtractProjectionSliceFromUnifiedVolume ... 
                            (realVolume, imagVolume, N, pivot, angle);

% Backtransforming the slice to the spatial domain to yield the 
% projection followed by 2D FFT-shift for the projection. 
image = fftshift(abs(ifft2(((projectionSlice)))));

end
