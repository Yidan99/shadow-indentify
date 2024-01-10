%{
img1 = imread('D:/STUDY/1PhD/blender model/clock/output_s/0020.png');
img2 = imread('D:/STUDY/1PhD/blender model/charizar/output_s/0001.png');
img3 = imread('D:/STUDY/1PhD/blender model/telephone/output_s/0108.png');
images = {img1, img2, img3};
%}
%{
img1 = imread('D:/STUDY/1PhD/blender model/charizar/output_s/0010.png');
img2 = imread('D:/STUDY/1PhD/blender model/charizar/output_s/0030.png');
img3 = imread('D:/STUDY/1PhD/blender model/charizar/output_s/0060.png');
img4 = imread('D:/STUDY/1PhD/blender model/charizar/output_s/0080.png');
img5 = imread('D:/STUDY/1PhD/blender model/charizar/output_s/0100.png');
img6 = imread('D:/STUDY/1PhD/blender model/charizar/output_s/0120.png');
%}

%{
img1 = imread('D:/STUDY/1PhD/blender model/coffee/output_s/0010.png');
img2 = imread('D:/STUDY/1PhD/blender model/coffee/output_s/0030.png');
img3 = imread('D:/STUDY/1PhD/blender model/coffee/output_s/0060.png');
img4 = imread('D:/STUDY/1PhD/blender model/coffee/output_s/0080.png');
img5 = imread('D:/STUDY/1PhD/blender model/coffee/output_s/0100.png');
img6 = imread('D:/STUDY/1PhD/blender model/coffee/output_s/0120.png');
%}
%{
img1 = imread('D:/STUDY/1PhD/blender model/sofa/output_s/0010.png');
img2 = imread('D:/STUDY/1PhD/blender model/sofa/output_s/0040.png');
img3 = imread('D:/STUDY/1PhD/blender model/sofa/output_s/0060.png');
img4 = imread('D:/STUDY/1PhD/blender model/sofa/output_s/0080.png');
img5 = imread('D:/STUDY/1PhD/blender model/sofa/output_s/0100.png');
img6 = imread('D:/STUDY/1PhD/blender model/sofa/output_s/0120.png');
%}
%{
img1 = imread('D:/STUDY/1PhD/blender model/dining set/output_s/0020.png');
img2 = imread('D:/STUDY/1PhD/blender model/dining set/output_s/0040.png');
img3 = imread('D:/STUDY/1PhD/blender model/dining set/output_s/0060.png');
img4 = imread('D:/STUDY/1PhD/blender model/dining set/output_s/0080.png');
img5 = imread('D:/STUDY/1PhD/blender model/dining set/output_s/0100.png');
img6 = imread('D:/STUDY/1PhD/blender model/dining set/output_s/0120.png');
%}

%{
img1 = imread('D:/STUDY/1PhD/blender model/box/output_s/3D_WoodenBox0010.png');
img2 = imread('D:/STUDY/1PhD/blender model/box/output_s/3D_WoodenBox0030.png');
img3 = imread('D:/STUDY/1PhD/blender model/box/output_s/3D_WoodenBox0060.png');
img4 = imread('D:/STUDY/1PhD/blender model/box/output_s/3D_WoodenBox0080.png');
img5 = imread('D:/STUDY/1PhD/blender model/box/output_s/3D_WoodenBox0100.png');
img6 = imread('D:/STUDY/1PhD/blender model/box/output_s/3D_WoodenBox0120.png');
%}


%{
img1 = imread('D:/STUDY/1PhD/blender model/judy/output_s/0010.png');
img2 = imread('D:/STUDY/1PhD/blender model/judy/output_s/0030.png');
img3 = imread('D:/STUDY/1PhD/blender model/judy/output_s/0060.png');
img4 = imread('D:/STUDY/1PhD/blender model/judy/output_s/0080.png');
img5 = imread('D:/STUDY/1PhD/blender model/judy/output_s/0100.png');
img6 = imread('D:/STUDY/1PhD/blender model/judy/output_s/0120.png');
%}

%{
img1 = imread('D:/STUDY/1PhD/blender model/telephone/output_s/0010.png');
img2 = imread('D:/STUDY/1PhD/blender model/telephone/output_s/0030.png');
img3 = imread('D:/STUDY/1PhD/blender model/telephone/output_s/0060.png');
img4 = imread('D:/STUDY/1PhD/blender model/telephone/output_s/0080.png');
img5 = imread('D:/STUDY/1PhD/blender model/telephone/output_s/0100.png');
img6 = imread('D:/STUDY/1PhD/blender model/telephone/output_s/0120.png');
%}

%{%}
img1 = imread('D:/STUDY/1PhD/blender model/clock/output_s/0010.png');
img2 = imread('D:/STUDY/1PhD/blender model/clock/output_s/0030.png');
img3 = imread('D:/STUDY/1PhD/blender model/clock/output_s/0060.png');
img4 = imread('D:/STUDY/1PhD/blender model/clock/output_s/0080.png');
img5 = imread('D:/STUDY/1PhD/blender model/clock/output_s/0100.png');
img6 = imread('D:/STUDY/1PhD/blender model/clock/output_s/0079.png');


%{
img1 = imread('D:/STUDY/1PhD/blender model/clock2/output_s/0010.png');
img2 = imread('D:/STUDY/1PhD/blender model/clock2/output_s/0030.png');
img3 = imread('D:/STUDY/1PhD/blender model/clock2/output_s/0060.png');
img4 = imread('D:/STUDY/1PhD/blender model/clock2/output_s/0080.png');
img5 = imread('D:/STUDY/1PhD/blender model/clock2/output_s/0100.png');
img6 = imread('D:/STUDY/1PhD/blender model/clock2/output_s/0002.png');
%}

images = {img1, img2, img3, img4, img5, img6};

shadowMasks = cell(1, 6); 


figure;

for idx = 1:length(images)
    
    img = images{idx};
    
    if size(img, 3) == 4
        alphaChannel = img(:, :, 4) > 0;
        img = img(:, :, 1:3);
    else
        alphaChannel = any(img > 0, 3);
    end
    
    finalShadowMask = zeros(size(alphaChannel));
    filteredImage = img .* uint8(cat(3, alphaChannel, alphaChannel, alphaChannel));

    hsvImage = rgb2hsv(filteredImage);

    hueImage = hsvImage(:,:,1);

    filteredHueImage = imbilatfilt(hueImage);

    Hueimg = filteredHueImage;

    gray_img = Hueimg;

    gray_img(repmat(~alphaChannel, [1 1])) = -1;
    valid_values = gray_img(gray_img ~= -1);

    [counts, bin] = imhist(valid_values);
    counts(2) = 2*counts(1) + counts(2);


    [peaks, locs] = findpeaks(counts, 'MinPeakHeight', 250, 'MinPeakDistance', 15);
    mask = zeros(size(gray_img));
    masked = mask;

    for i = 1:length(locs)
       
        if i == 1
            lower_bound = 0;
        else
            lower_bound = bin(round(0.5*(locs(i) + locs(i-1))));
        end

        if i == length(locs) 
            upper_bound = 1;
        else
            upper_bound = bin(round(0.5*(locs(i+1) + locs(i))));
        end
        mask(gray_img >= lower_bound & gray_img <= upper_bound) = 255 * (i / length(locs));
        masked(gray_img >= lower_bound & gray_img <= upper_bound) = i;
    end
    
    
    for i = 1:max(masked(:))
    regionMask = (masked == i) & alphaChannel;
    
    if any(regionMask(:))
        labImg = rgb2lab(img);
        L1 = labImg(:,:,1);
        A1 = labImg(:,:,2);
        B1 = labImg(:,:,3);
        
        L1f = imbilatfilt(L1);
        
        L = L1f(regionMask);
        A = A1(regionMask);
        B = B1(regionMask);
        
        
        
        
       %{%}
        lowerPrctileL = prctile(L, 10);
        upperPrctileL = prctile(L, 90);
        mid80L =  L(L >= lowerPrctileL & L <= upperPrctileL);
       

        %medianL = median(L, 'all');
        
        %meanL = mean(mid80L, 'all');
        meanL = mean(L, 'all');
        meanA = mean(A, 'all');
        meanB = mean(B, 'all');
        %stdL = std(L, 0, 'all');
        stdL = std(mid80L, 0, 'all');

        if meanA + meanB <= 256
           thresholdL = meanL - 0.4 * stdL;
            %thresholdL = medianL - stdL/3;
            % Apply the threshold only within the region of interest
            regionShadowMask = L1(regionMask) <= thresholdL;
        else 
            % Apply two conditions only within the region of interest
            regionShadowMask = (L1(regionMask) < meanL) & (B1(regionMask) < meanB);
        end
        
        % Initialize a mask for the whole image with false values
        shadowMask = zeros(size(alphaChannel));
       
        % Now assign the region-specific shadow mask to the corresponding region in the full image mask
        shadowMask(regionMask) = regionShadowMask;
        
        shadowMask = shadowMask & alphaChannel;
  
        
        finalShadowMask = finalShadowMask | shadowMask;
        shadowMaskImage = uint8(finalShadowMask) * 255;
        
        shadowMaskImage = medfilt2(shadowMaskImage, [5 5]);  % ??????? 3x3 ????
        shadowMaskImage = shadowMaskImage & alphaChannel;
        shadowMasks{idx} = shadowMaskImage;
        end
    end

    %{
    subplot(3, 3, 3*idx-2);
    imshow(img);
    title(['Original Image ', num2str(idx)]);
   
    subplot(3, 3, 3*idx-1);
    imshow(uint8(mask), []);
    title(['mask', num2str(idx)]);

    subplot(3, 3, 3*idx);
    imshow(shadowMasks{idx});
    title(['Shadow Mask ', num2str(idx)]);
    %}
    
    subplot(3, 4, 2*idx-1);
    imshow(img);
    title(['Original Image ', num2str(idx)]);
    
    subplot(3, 4, 2*idx);
    imshow(shadowMasks{idx});
    title(['Shadow Mask ', num2str(idx)]);
    
    
end

