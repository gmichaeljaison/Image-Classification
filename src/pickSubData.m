function [ XSub, classSub ] = pickSubData( X, class, subsize )

    sp = categorical(class);
    labels = cell2mat(categories(sp));
    
    XSub = [];
    classSub = [];
    for i = 1 : size(labels,1)
        c = str2double(labels(i));
        Xc = X(class == c,:);
        Xc_sub = Xc(randperm(size(Xc,1), subsize),:);
        XSub = [XSub; Xc_sub];
        classSub = [classSub; ones(subsize,1)*c];
    end
    
    randOrder = randperm(subsize * size(labels,1));
    XSub = XSub(randOrder,:);
    classSub = classSub(randOrder);

end
