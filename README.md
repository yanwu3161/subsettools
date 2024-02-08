# subsettools
An R packages for subsetting Seurat objects in batches.
This R package is designed for efficiently subsetting Seurat objects in batches and saving them as RDS files
and/or storing these subsets as new Seurat objects in the R environment.
# Download
you can install this package in R by this code
```r
install_github("https://github.com/yanwu3161/subsettools")
```
# seurat_object:
The name of the Seurat object to be processed.
# filter_elements: 
The column names for subset operations, which can be found in the meta.data file of the Seurat object.
# save_directory: 
The storage path for the subsets.
# save_RDS:
RDS file storage feature, enabled by default.
# save_Environment: 
Environment variable storage feature, disabled by default.
# function
This Package has an Function named FilterAndSavesubset_RDS
```r
FilterAndSavesubset_RDS(seurat_object = ,

                        filter_elements = "",
                        
                        save_directory = "",
                        
                        save_RDS = TRUE,
                        
                        save_Enviroment = FALSE)
```
# 
*This R package is intended for educational and exchange purposes only.*
#
Feel free to discussion, my email: Niceecake@outlook.com
