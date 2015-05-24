function [paddedVolume, NFinal] = ZeroPadUnifiedVolume(volume, N)

NFinal = N * 2;
paddedVolume = zeros(NFinal, NFinal, NFinal);
startIndex = N / 2;
% Center the input volume in the unified one
for ii = 1:1:N
    for jj = 1:1:N
        for kk = 1:1:N
            paddedVolume(ii + startIndex, ...
                          jj + startIndex, ...
                          kk + startIndex) = volume(ii, jj, kk);
        end 
    end
end

end
