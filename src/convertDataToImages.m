function [ imgs ] = convertDataToImages( data )

    % convert data into RGB images
    imgs = uint8(zeros(32, 32, 3, size(data,1)));
    for i = 1 : size(data, 1)
        imgs(:,:,:,i) = reshape(data(i,:), [32, 32, 3]);
        imgs(:,:,:,i) = imrotate(imgs(:,:,:,i), -90);
    end

end

