function [ Y ] = classify( Model, X )

    X = extractFeatures(X);

%     Y = predict(Model, im_features);

    dist = pdist2(X, Model.X);
    
    N = size(X,1);
    Y = zeros(N,1);
    for i = 1 : N
        distI = dist(i,:);
        [~,sortInd] = sort(distI);
        topKInd = sortInd(1:Model.K);
        Y(i) = mode(Model.Y(topKInd));
    end

end


% For octave - comment for matlab
% function dist = pdist2(X, Y)
%     M = size(X,1);
%     N = size(Y,1);
%     
%     dist = zeros(M,N);
%     
%     for i = 1 : M
%         x = X(i,:);
%         diff = repmat(x, N, 1) - Y;
%         dist(i,:) = norm(diff, 2, 'rows')';
%     end
% end
