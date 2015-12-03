function [ X_features ] = extractFeatures( X )

    n = size(X,1);

%   1. convert into images
    imgs = convertDataToImages(X);

%   2. extract hog features
    X_features = [];
    for i = 1 : size(imgs, 4)
        im = imgs(:,:,:,i);
        X_features(end+1,:) = extract_feature(im);
    end

end
