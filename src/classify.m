function [ Y ] = classify( Model, X )

    im_features = extractFeatures(X);

    Y = Model.predict(im_features);

end
