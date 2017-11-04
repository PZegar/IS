function b = showImage(x)
    originalImage = imread(x);
    figure
%    imshow(originalImage)
    grayImage = rgb2gray(originalImage)
    filteredImage = wiener2(grayImage,[5 5])
    imshow(filteredImage)
    SE = strel('arbitrary',eye(5))
    filteredImage = imerode(filteredImage,SE)
    
    bw = double(filteredImage > mean(filteredImage(:)));
    imshow(bw)
%    b = find(bw == 0);
    numberOfPixels = numel(bw)
    numberOfTruePixels = sum(bw(:));
%    disp(numberOfPixels)
 %   disp(numberOfTruePixels)
    disp(numberOfTruePixels / numberOfPixels)
end