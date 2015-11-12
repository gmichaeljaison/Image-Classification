function batchToVisualWords(numCores) 

% Does parallel computation of the visual words 
%
% Input:
%   numCores - number of cores to use (default 2)

tic

if nargin < 1
    %default to 2 cores
    numCores = 2;
end

% Close the pools, if any
try
    fprintf('Closing any pools...\n');
%     matlabpool close; 
    delete(gcp('nocreate'))
catch ME
    disp(ME.message);
end

fprintf('Starting a pool of workers with %d cores\n', numCores);
% matlabpool('local',numCores);
parpool('local', numCores);

%load the files and texton dictionary
% load('../dat/traintest.mat','all_imagenames','mapping');
% load('dictionary.mat','filterBank','dictionary');
load('dictionary.mat','dictionary');
load('../data/subset_CIFAR10/small_data_batch_1.mat');

imgs = convertDataToImages(data);

% source = '../data/subset_CIFAR10/small_data_batch_1.mat';
% target = '../dat/'; 

% if ~exist(target,'dir')
%     mkdir(target);
% end
% 
% for category = mapping
%     if ~exist([target,category{1}],'dir')
%         mkdir([target,category{1}]);
%     end
% end

%This is a peculiarity of loading inside of a function with parfor. We need to 
%tell MATLAB that these variables exist and should be passed to worker pools.
% filterBank = filterBank;
dictionary = dictionary;

%matlab can't save/load inside parfor; accumulate
%them and then do batch save
l = size(imgs,4);

% wordRepresentation = cell(l,1);
wordMaps = zeros(size(data,1),1);
parfor i=1:l
%     fprintf('Converting to visual words %s\n', all_imagenames{i});
%     image = imread([source, all_imagenames{i}]);
%     image = impyramid(image, 'reduce');
%     image = impyramid(image, 'reduce');
    
%     wordRepresentation{i} = getVisualWords(image, filterBank, dictionary);

    image = imgs(:,:,:,i);
    wordMaps(i) = getVisualWords(image, [], dictionary);
end

save('wordMaps', 'wordMaps');

%dump the files
% fprintf('Dumping the files\n');
% for i=1:l
%     wordMap = wordRepresentation{i};
%     save([target, strrep(all_imagenames{i},'.jpg','.mat')],'wordMap');
% end

%close the pool
fprintf('Closing the pool\n');
matlabpool close

toc

end
