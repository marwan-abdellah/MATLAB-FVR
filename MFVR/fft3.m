function [spectrum] = fft3 (data)

% Compute the 3D spectrum of a volume 
spectrum = fft(fft(fft(data,[],1),[],2),[],3); 

end 