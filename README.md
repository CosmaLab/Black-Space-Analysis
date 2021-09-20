
# Black Area Analysis 

This code is used to quantify the percentage of a Region of Interest with No localizations or Low density  of localizations (i.e. the "Black area") over the total area. 



## Input

`.bin` files (select your ROIs of interest first). 
## Output 
Generates percentage of a Region Of Interest (ROI) with no localizations or low density of localizations(i.e the "Black Space") over the total area found in the workspace and are automatically saved as a .xls file. 
## Composed by:
- `BlackSpace_MAIN.m`: main script, code to open to run the analysis.
- `QuickDensity.m`: accessory function
  
## Tested
- Tested using Matlab_2016b, R2016a, and MATLAB R2021a.

  
## Authors
- Code by Chiara Vicario, modified by Alvaro Castells-Garcia
- README and annotation updated by Victoria Neguembor 

  
## Deployment

To deploy this project run

```
1. Open Main code: "BlackSpace_MAIN"

2. Adjust the following parameters: 
	•	Number of experimental categories
	•	Define file path to folder containing files to analyze
	•	Adjust name of categories
	•	Adjust size of ROI by changing MaxX and MaxY values (ex 256 or 512 pixels)
	•	Super resolution Pixel size and Gaussian sigma can be adjusted but better to start by and keep default values (i.e. 20 nm and 2)
	•	Check and adjust if necessary adaptive threshold value (for example 0.001) 

3. Run script.

4. Load .bin files for each category.

5. The script will generate 1 Figure per each file containing the visualization of localizations, the mask of DNA, and the mask of the whole nucleus.

6. Visually check the masks and segmentations generated. Adjust parameters if necessary and launch analysis again.

7. Check results, they are in the cell variable “percentage_black” in the Workspace and automatically saved at source directory as Blackspace_result.xlsx file.   

```
## Research Implementation
Example Methods summary for Black Space analysis (from Neguembor et al Mol Cell 2021): 
Quantification of DNA-free areas. DNA-free area was quantified from DNA STORM images by applying a binary threshold on a Gaussian filtered density map (imbinarize.m Matlab function, with adaptive threshold, sensitivity of 0.001, pixel size 20 nm, sigma 2). Percentage of DNA-free areas over the imaged nuclear area were estimated for each nucleus.



  
