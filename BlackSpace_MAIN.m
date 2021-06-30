%% Code by Chiara VICARIO 2019-02
% Further annotated & Readme file by Victoria NEGUEMBOR 2021-06
%%Quantification of Black space (i.e. region with no or low density of localixations) inside the nucleus (or any ROI)

clear all 
close all

% % number of categories (each category may include many files)
categ = 2;
% 
categname = {{'DMSO'},{'WAPL DMSO'},{''},{''}};

% load .bin data of localizations 
% Note: Pre select ROIs of interest like nuclei beforehand in Fiji or
% alternative methods. Works also with .bin from Cluster analysis.

for m = 1:categ
    % loop over the categories
    % load .bin

    Dataname{m} = uipickfiles;
    
end


for m = 1:categ

    data = Dataname{1,m};
    
    for k = 1:length(data)
            
        DD = Insight3(data{1,k});
        % take 3rd and 4th columns
        D = DD.data(:,3:4);
        % generate density map (20 refers to size of SR pixel)
        [Dens] = Vicky_QuickDensity(D(:,1),D(:,2),20);
        % smooth density map with gaussian filter ("2" refers to gaussian sigma) 
        h = fspecial('gaussian',[5 5], 2);
        Dens = filter2(h, Dens);
        % binarize DNA (you can adjust threshold (ie. 0.001) depending on
        % your dataset,scan different threshold values to find appropriate) 
        MaskDNA = imbinarize(Dens,'adaptive','Sensitivity',0.001);
%         figure, imshow(MaskDNA)
%       dilate the mask
        se = strel('disk',18);
        Filled = imdilate(MaskDNA, se);
        % fill the holes        
        Filled = imfill(Filled,'holes');
        % erode the mask
        Filled = imerode(Filled, se);
        
        % UNCHECK part below to visualize the density maps generated,
        % strongly suggested to setup conditions and identify problems. 
        % You will need to click on every figure to make analysis proceed
        % to next image
        % Recheck to proceed faster once you have set conditions
        
%         figure(1), subplot(1,3,1),imagesc(Dens), axis equal
%                     subplot(1,3,2),imagesc(MaskDNA),axis equal
%                     subplot(1,3,3),imagesc(Filled),axis equal
% %                                        
%                    m 
%                    k
% %                    
% %         waitforbuttonpress
        percentage_black{m,k} = 100-((sum(sum(MaskDNA))*100)/sum(sum(Filled)));

    end 
end


%%%% 
