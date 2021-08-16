
# Black Area Analysis 

This code is used to quantify the percentage of a Region of Interest with No localizations or Low density  of localizations (i.e. the "Black area") over the total area. 



## Input

`.bin` files (select your ROIs of interest first). 
## Output 
Generates pecentage of a Region Of Interest (ROI) with no localizations or low density of localizations(i.e the "Black Space") over the total area found in the workspace and are automatically saved as a .xls file. 
## Composed by:
- `Vicky_QuickDensity.m`: accessory function, open first, check and adjust to image dimension (ex. 256 or 512 pixels).
- `BlackSpace_MAIN.m`: main script, code to open to run the analysis. 

  
## Tested
- Tested using Matlab_2016b

  
## Authors
- Code by Chiara Vicario 
- README and annotation updated by Victoria Neguembor 

  
## Deployment

To deploy this project run

```
1.	Open accessory function "Vicky_QuickDensity" check and adjust to image dimension (ex. 256 or 512 pixels).

2.	Open Main code: "BlackSpace_MAIN"

3.	Adjust number of experimental categories

4.	Adjust name of categories

5.	Check and adjust if necessary adaptive threshold value (for example 0.001)

6.	Super resolution Pixel size and Gaussian sigma can also be adjusted but better to start by and keep default values (i.e. 20 nm and 2)

7.	Launch analysis

8.	Load .bin files for each category

9.	Check results in Worskpace. They are saved in the cell variable “percentage_black”. Save the workspace and or export values to other programs to plot. 

```

  
## TODO/FIXME
- Save output under a table format including name of categories(for example .csv, excel or any other format)

  
## Research Implementation
Example Methods summary for Black Space analysis (from Neguembor et al Mol Cell 2021): 
Quantification of DNA-free areas DNA-free area was quantified from DNA STORM images by applying a binary threshold on a Gaussian filtered density map (imbinarize.m Matlab function, with adaptive threshold, sensitivity of 0.001, pixel size 20 nm, sigma 2). Percentage of DNA-free areas over the imaged nuclear area were estimated for each nucleus.



  
