# Load required libraries
library(ggplot2)
library(tidyr)

# Read the TAB-separated file (not comma-separated!)
df <- read.table("matrix_long_form.tsv", header = FALSE, sep = "\t",
                 col.names = c("x", "y", "z"))

# Keep only fragment lengths <= 200 bp
df <- df[df$y <= 200, ]


# Aggregate if there are duplicate x,y combinations
if (nrow(df) > 0) {
  df <- aggregate(z ~ x + y, data = df, FUN = sum)
  
  # Plot
  ggplot(df, aes(x = x, y = y, fill = z)) +
    geom_tile() +
    scale_fill_gradient(low = "white", high = "purple", 
                        name = "Fragment center count") +
    labs(x = "Distance from motif center (bp)",
         y = "cfDNA fragment length (bp)",
         title = "V-plot heatmap (<=200 bp)") +
    theme_minimal()
  
  # Save the plot
  ggsave("vplot_heatmap.png", width = 8, height = 6, dpi = 300)
} else {
  cat("ERROR: No data after filtering!\n")
}