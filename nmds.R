# Load necessary libraries
library(vegan)
library(ggplot2)
library(ggrepel)
library(tibble)
library(dplyr)

# Read the data
Data <- read.delim('insect_data.txt', header=TRUE, sep="\t")
#Data <- read.delim('article_insect_data.txt', header=TRUE, sep="\t")

View(Data)

# Select relevant columns for analysis
metab_n <- Data[,4:640]
#metab_n <- Data[,4:20]

#View(metab_n)

# Create a distance matrix using Bray-Curtis dissimilarity
distance_matrix <- vegdist(metab_n, method = "bray")

# Perform NMDS (Non-Metric Multidimensional Scaling)
set.seed(321)
nmds_result <- metaMDS(distance_matrix, k = 2, trymax = 1000) # k = 2 dimensions, trymax = max iterations

# Print NMDS result summary
print(nmds_result)

# Extract NMDS site scores (coordinates for samples)
nmds_sites <- as.data.frame(nmds_result$points)
# Check if NMDS converged
if (is.null(nmds_result$points)) {
  stop("NMDS did not converge. Check data and try increasing 'trymax'.")
}


# Check if NMDS converged
if (is.null(nmds_result$points)) {
  stop("NMDS did not converge. Check data and try increasing 'trymax'.")
}

# Extract NMDS site scores
nmds_sites <- as.data.frame(nmds_result$points)

# Add sample names for plotting
nmds_sites$sample <- Data$sample
nmds_sites$sex <- Data$sex
nmds_sites$ratio <- log(Data$ratio)


lines_scale <- 2

print(lines_scale)

# Plot the NMDS results
ggplot(data = nmds_sites, aes(x = MDS1, y = MDS2, label = sample, color = sex)) +
  geom_point(size = 3) +
  geom_label_repel(aes(label = sample), 
                   box.padding = 0.35, 
                   point.padding = 0.3, 
                   segment.color = 'grey50') +
  theme_bw() +
  xlab("NMDS1") +
  ylab("NMDS2") +
  ggtitle("Non-Metric Multidimensional Scaling (NMDS)") +
  coord_fixed(ratio = 1) +  # Equal aspect ratio
  scale_x_continuous(breaks = seq(-lines_scale, lines_scale, by = 1), limits = c(-lines_scale, lines_scale)) +  # Adjust X-axis limits
  scale_y_continuous(breaks = seq(-lines_scale, lines_scale, by = 1), limits = c(-lines_scale, lines_scale))   # Adjust Y-axis limits

