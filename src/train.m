function [ Model ] = train( trainX, labelX )

    im_features = extractFeatures(trainX);
    
%     Model = fitcknn(im_features, labelX,'NumNeighbors',10,'Standardize',1);

    Model = struct('X', im_features, 'Y', labelX, 'K', 10);

end
