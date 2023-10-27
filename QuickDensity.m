%% Code by Chiara VICARIO 2019-02
% Further annotated & Readme file by Victoria NEGUEMBOR 2021-06
%%Accessory function for Black Space Quantification
%% Further annotated by Laura MARTIN 2023-10

%%Input from BlackSpace_MAIN: 
%% x,y localizations coordinates
%% SR_px size of super resolved px (20nm)
%% size of original STORM image

function [Dens] = DensityForSTORMImages_AA(x,y,SR_px,minX,maxX,minY,maxY)
 % adjust maxX and maxY to original image size (ex 256 or 512 for NSTORM)
% minX = 0;
% maxX = 256;
% minY = 0;
% maxY = 256;

%% i.e. 20nm/160nm=0.125=binning factor

SR_px = SR_px/160;

%% axes from min to max are binned with the
%% first bin and last bins centered in the first and last values
%% example: 0:0.250:1 (you expect to count 1:0.250=4 bins)
%% but bins will be 5: 0-0.124; 0.125-0.374; 0.375-0.624; 0.625-0.874; 0.875-1.
%% because the first and last ones are half the bin size.

%%If min:SR_px:max is 0:0.125:256 = 2048 expected
%%(1 bin of 0.0625 + 2047 bins of 0.125) + (1bin of 0.0625) =2049 bins

coor_bins{1} = minX:SR_px:maxX;
coor_bins{2} = minY:SR_px:maxY;

%% x and y coordinates are assigned to the bins in an histogram
Dens = hist3([x y],coor_bins);

end
