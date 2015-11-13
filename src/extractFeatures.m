function [ X_features ] = extractFeatures( X )

    n = size(X,1);

%   1. convert into images
    imgs = convertDataToImages(X);

%   2. extract hog features
    X_features = zeros(n, 8*8*31);
    for i = 1 : size(imgs, 4)
        im = imgs(:,:,:,i);
        X_features(i,:) = extract_feature(im);
    end

end
