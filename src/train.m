function [ Model ] = train( trainX, labelX )

    n = size(trainX,1);

%   1. convert into images
    imgs = convertDataToImages(trainX);

%   2. extract hog features
    im_features = zeros(n, 4*4*31);
    for i = 1 : size(imgs, 4)
        im = imgs(:,:,:,i);
        im_features(i,:) = extract_feature(im);
    end

end
