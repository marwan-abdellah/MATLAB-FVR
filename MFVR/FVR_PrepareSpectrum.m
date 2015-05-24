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

function [spectrum, realPart, imagPart, NFinal] = FVR_PrepareSpectrum(dataPath)

% Loading the volume data from the RAW file 
% dataPath = 'Z:/mFVR/CTData/CTData';
[volumeData, NX, NY, NZ] = LoadDataSet(dataPath); 

% Convert the data to a 3D distribution and free the volumeData
volume = ConvertDataTo_3D_Volume(volumeData, NX, NY, NZ);
clear volumeData;

% Unify the volume 
[volume, N] = UnifyVolume(volume, NX, NY, NZ);

% Zeropad the volume to avoid ghosting 
% [volume, NFinal] = ZeroPadUnifiedVolume(volume, N);

Nfinal = N;

% 3D FFT-shift for the spatial volume
volume = fftshift(volume);

% Compute the 3D Spectrum 
spectrum = fft3(volume); 

% Do a fft shift 
spectrum = fftshift(spectrum);

% Split the volume to the two components real and imaginary, and fine the
% projection slice for every component.
[realPart, imagPart] = SplitComplexVolume(spectrum, NFinal, NFinal, NFinal);
end
