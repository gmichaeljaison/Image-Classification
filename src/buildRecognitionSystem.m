tic

load('dictionary.mat');
% load('traintest.mat');
load('wordMaps.mat');

% source = '../dat/';
layers = 2;
k_classes = size(dictionary,2);
train_size = size(data,1);

% train_features is a { K (4^(L+1) - 1) /3 x T } matrix of all training histograms.  
hist_size = k_classes * (4 ^ (layers + 1) - 1) / 3;
train_features = zeros(hist_size, train_size);

for i = 1 : train_size
%     path = strcat(source, train_imagenames{i});
%     path = strrep(path, '.jpg', '.mat');
%     load(path);
    
%     hist = getImageFeaturesSPM(layers, wordMap, k_classes);
    getImageFeatures(wordMaps(i), k_classes);
    train_features(:,i) = hist;
end

save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

toc