%% Code by Chiara VICARIO 2019-02, modified by Alvaro CASTELLS-GARCIA 2021-07
% Further annotated & Readme file by Victoria NEGUEMBOR 2021-07
%%Quantification of Black space (i.e. region with no or low density of localizations) inside the nucleus (or any ROI)

clear all 
close all

% % number of categories (each category may include many files) and 
% File directory ("Directorio")
categ = 2;
Directorio = ('C:\Users\');
categname = {'Condition1','Condition2'};
% load .bin data of localizations 
% Note: Pre select ROIs of interest like nuclei beforehand in Fiji or
% alternative methods. Works also with .bin from Cluster analysis.

minX = 0;
maxX = 256;
minY = 0;
maxY = 256;


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
        [Dens] = QuickDensity(D(:,1),D(:,2),20,minX,maxX,minY,maxY);
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
        
        % COMMENT part below to skip visualization of density maps and masks generated,
          figure, subplot(1,3,1),imagesc(Dens), axis equal
                     subplot(1,3,2),imagesc(MaskDNA),axis equal
                     subplot(1,3,3),imagesc(Filled),axis equal
                                        
                   % m 
                   % k
                    
        percentage_black{m,k} = 100-((sum(sum(MaskDNA))*100)/sum(sum(Filled)));

    end 
end

 Percentageblacktosave = percentage_black';
 t = cell2table(Percentageblacktosave);
 t.Properties.VariableNames  = categname;
 writetable(t,strcat(Directorio,'\Blackspace_results.xlsx'));
%%%% 
