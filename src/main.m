load('../data/subset_CIFAR10/batches.meta.mat');
load('../data/subset_CIFAR10/small_data_batch_1.mat');
% load('../data/subset_CIFAR10/small_data_batch_2.mat');
% load('../data/subset_CIFAR10/small_data_batch_3.mat');
% load('../data/subset_CIFAR10/small_data_batch_4.mat');
% load('../data/subset_CIFAR10/small_data_batch_5.mat');

train(data, labels);
