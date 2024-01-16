library(scales)
library(svglite)
library(ggplot2)
library(reshape)
library(dplyr)

# Read the file
df_final <- read.table("3_table_HADEG_final.tsv", header = TRUE, stringsAsFactors = FALSE, sep = "\t", comment.char = "", fill = TRUE)

# Get all unique names in the "Compound" column
unique_compounds <- unique(df_final$Compound)

# List to store the read DataFrames
df_list <- list()

# Iterate over the list of unique compounds
for (compound in unique_compounds) {
  # Create the file name with the desired format
  file_name <- paste0("4_", gsub("/", "_", compound), ".tsv")
  
  # Read the specific TSV file for the current compound
  compound_df <- read.table(file_name, header = TRUE, stringsAsFactors = FALSE, sep = "\t", comment.char = "", fill = TRUE)

  # Add the DataFrame to the list
  df_list[[file_name]] <- compound_df
}

# Apply melt to each DataFrame in the list
melted_df_list <- lapply(df_list, function(df) melt(df, id.vars = c("Gene", "Mechanism", "Compound", "Pathway", "Subpathway")))

# Access the DataFrames in the list using the file names as keys
# Example: df_list$"4_A_Alkanes.tsv"

# You can access the melted DataFrames through melted_df_list
# melted_df_list[[1]] contains the first melted DataFrame, and so on

# Define the new column names
new_column_names <- c("Gene", "Mechanism", "Compound", "Pathway", "Subpathway", "Genome", "Number")

# Iterate over the list of melted DataFrames
for (i in seq_along(melted_df_list)) {
  # Change the column names
  colnames(melted_df_list[[i]]) <- new_column_names
}

# Combine all melted DataFrames into one
combined_df <- bind_rows(melted_df_list, .id = "group")

# Define the color names and legend titles
colors <- c("#a9d6e5", "#012a4a")  # You can add more colors as needed

# Generate the heatmap plot
svg("Heatmap_Genes_HADEG.svg", width=15, height=6)
ggplot(combined_df, aes(x = Gene, y = Genome, fill = Number, group = group)) +
  geom_tile(color = "white", lwd = 1) +
  scale_fill_gradientn(colors = colors, name = "", labels = scales::comma) +
  facet_grid(~ group, scales = "free_x", space = "free") +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 1, hjust = 1, size = 9),
    axis.text.y = element_text(hjust = 1, size = 9),
    axis.title.x = element_text(size = 12, face = "bold"),
    axis.title.y = element_text(size = 12, face = "bold"),
    legend.title = element_text(size = 13),
    legend.text = element_text(size = 13),
    strip.text.x = element_text(size = 10, face = "bold")
  )
dev.off()

# Combine all melted DataFrames into one
combined_df <- bind_rows(melted_df_list, .id = "group")
combined_df[combined_df==0]<-NA

# Define the colors for each Compound
colors <- c("#003566", "#fcbf49", "#f77f00", "#d62828", "#caf0f8", "#03045e", "#a9d6e5")  # Add more colors as needed

# Generate the bubble plot
svg("Bubbles_Genes_HADEG.svg", width = 15, height = 12)
ggplot(combined_df, aes(x = Genome, y = Pathway, size = Number, fill = Compound)) +
  geom_point(shape = 21, color = "black") +
  scale_fill_manual(values = colors) +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 1, hjust = 1, size = 15),
    axis.text.y = element_text(hjust = 1, size = 15),
    axis.title.x = element_text(size = 20, face = "bold"),
    axis.title.y = element_text(size = 20, face = "bold"),
    legend.title = element_text(size = 14),
    legend.text = element_text(size = 14),
    strip.text.x = element_text(size = 12, face = "bold")
  )
dev.off()
