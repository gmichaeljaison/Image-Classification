function [ Y ] = classify( Model, X )

    im_features = extractFeatures(X);

%     Y = Model.predict(im_features);

    Y = mnrval(Model, im_features);

end
