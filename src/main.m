load('../data/subset_CIFAR10/batches.meta.mat');

X = zeros(5000, 3072);
class = zeros(5000, 1);

load('../data/subset_CIFAR10/small_data_batch_1.mat');
X(1:1000,:) = data;
class(1:1000) = labels;

load('../data/subset_CIFAR10/small_data_batch_2.mat');
X(1001:2000,:) = data;
class(1001:2000) = labels;

load('../data/subset_CIFAR10/small_data_batch_3.mat');
X(2001:3000,:) = data;
class(2001:3000) = labels;

load('../data/subset_CIFAR10/small_data_batch_4.mat');
X(3001:4000,:) = data;
class(3001:4000) = labels;

load('../data/subset_CIFAR10/small_data_batch_5.mat');
X(4001:5000,:) = data;
class(4001:5000) = labels;

% any subset can be set as training and test data
xTrain = X(1:4000,:);
classTrain = class(1:4000);
xTest = X(4001:5000,:);
classTest = class(4001:5000);

[xTrain, classTrain] = pickSubData(xTrain, classTrain, 10);
[xTest, classTest] = pickSubData(xTest, classTest, 1);

Model = train(xTrain, classTrain);
predClass = classify(Model, xTest);

C = confusionmat(classTest, predClass);
accuracy = sum(diag(C)) / sum(C(:));
