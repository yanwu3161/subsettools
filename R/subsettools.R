#' @export

# This R package is designed for efficiently subsetting Seurat objects in batches and saving them as RDS files
# and/or storing these subsets as new Seurat objects in the R environment.
#
# seurat_object: The name of the Seurat object to be processed.
# filter_elements: The column names for subset operations, which can be found in the meta.data file of the Seurat object.
# save_directory: The storage path for the subsets.
# save_RDS: RDS file storage feature, enabled by default.
# save_Environment: Environment variable storage feature, disabled by default.
#
# This R package is intended for educational and exchange purposes only.
#
# Vision:v1.0.1
#
# Feel free to discussion, my email: Niceecake@outlook.com


FilterAndSavesubset_RDS <- function(seurat_object,
                                    filter_elements = "",
                                    save_directory = "",
                                    save_RDS = TRUE,
                                    save_Enviroment = FALSE,
                                    prefix = ""){

  subset_list <- list()
  unique_elements <- unique(seurat_object@meta.data[[filter_elements]])
  unique_elements <- sort(unique_elements)

  ##Read unique elements and arrange them in order.

  if (save_RDS) {
    for (i in unique_elements) {
      subset_data <- seurat_object[, seurat_object@meta.data[[filter_elements]] == i]
      subset_name <- paste0(prefix,filter_elements,"_", i, ".rds")
      save_path <- file.path(save_directory, subset_name)
      saveRDS(subset_data, file = save_path)
      cat("This RDS file has saved to your path:", subset_name, ".\n")
    }
  } else {
    cat("RDS file storage functionality has been disabled.\n")
  }

  ##RDS file saving function

  if (save_Enviroment) {

    for (i in unique_elements) {
      environment_data <- seurat_object[, seurat_object@meta.data[[filter_elements]] == i]
      environment_name <- paste0(filter_elements, "_",i)
      assign(environment_name, environment_data, envir = .GlobalEnv)
      cat("This subset has saved as an environment:", environment_name, ".\n")
    }
  }
  else{
    cat("Environment saving functionality has been disabled..\n")
  }

  ##Environment Variable Saving function

}
