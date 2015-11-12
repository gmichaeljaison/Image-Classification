function [ Model ] = train( trainX, labelX )

    im = convertDataToImages(trainX);

%     [filterBank] = createFilterBank();
    
    K = 100;
%     alpha = 50;
    filterResponses = [];

    for i = 1 : size(im, 4)
        I = im(:,:,:,i);
        
        filterResp = extract_feature(I);
        filterResponses = [filterResponses; filterResp'];

        % filterResponses: (h*w) x (3*filter-size)
%         [filterResponsesI] = extractFilterResponses(I, filterBank);

        % select random alpha pixels ->  (alpha) x (3*filter-size)
%         randIndices = randperm(size(filterResponsesI, 1), alpha);
%         filterResponses = [filterResponses; filterResponsesI(randIndices, :)];
    end

    [~, dictionary] = kmeans(filterResponses, K, 'EmptyAction','drop');
%     dictionary = dictionary';

    save('dictionary.mat','dictionary');

end

