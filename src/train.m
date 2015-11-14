function [ Model ] = train( trainX, labelX )

    im_features = extractFeatures(trainX);
    
%     Model = fitNaiveBayes(im_features, labelX);

    sp = categorical(labelX);
    
    Model = mnrfit(im_features, sp);
    
end
