function [volumeData, NX, NY, NZ] = LoadDataSet(pathToData)

% The path to the data directory will be appended by the .hdr extension to
% get the size of the data set and then will be appended by the .img
% extension to fetch the data. 
pathToHdrFile = strcat(pathToData, '.hdr');

% Load the data size 
[NX, NY, NZ] = textread(pathToHdrFile, '%d %d %d', 1); 
fprintf('The loaded volume has size of [%d x %d x %d] \n', NX, NY, NZ);

% Load the volume data 
pathToDataFile = strcat(pathToData, '.img'); 
% Read binary file that contain 1-byte data (fopen) fId is the identifier 
% Use full path to avoid invalid identifiers.
[fId, outMessage] = fopen(pathToDataFile);
disp(outMessage);

% Return the volume data
volumeData = fread(fId, 'uchar','b');

end 