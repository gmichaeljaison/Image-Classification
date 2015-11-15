function [ Y ] = classify( Model, X )

    im_features = extractFeatures(X);

    Y = predict(Model, im_features);

end
