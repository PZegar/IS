function b = ImageProc2(x)
 
    originalImage = imread(x); %wczytywanie obrazu
    figure
    imshow(originalImage)
    grayImage = rgb2gray(originalImage) %zmiana na czarno-biale
    
    filteredImage = wiener2(grayImage,[2.5 1]) %funkcja odszumiania
    
    
    SE = strel('arbitrary',eye(3)) %okreslenie elementu struktury
   % filteredImage = imerode(filteredImage, SE) %erozja
   
    figure
    imshow(filteredImage)   
    monochromatic = double(filteredImage > mean(filteredImage(:))); %binaryzacja
    %imshow(blackAndWhite);
    numberOfWhitePixels = numel(monochromatic)
    numberOfAllPixels = sum(monochromatic(:));
    %disp(x)
    %disp(y)
    %disp(numberOfAllPixels)
    disp(numberOfAllPixels / numberOfWhitePixels)
    %    end
    %end
end

    %zdjecie 1 ~28% martenzytu 
    %zdjecie 2 ~29% martenzytu
    %zdjecie 2 ~32% martenzytu