%% Code by Chiara VICARIO 2019-02
% Further annotated & Readme file by Victoria NEGUEMBOR 2021-06
%%Accessory function for Black Space Quantification

function [Dens] = Vicky_DensityForSTORMImages_AA(x,y,SR_px)
 % adjust maxX and maxY to original image size (ex 256 or 512 for NSTORM)
minX = 0;
maxX = 256;
minY = 0;
maxY = 256;

SR_px = SR_px/160;

coor_bins{1} = minX:SR_px:maxX;
coor_bins{2} = minY:SR_px:maxY;

Dens = hist3([x y],coor_bins);

end