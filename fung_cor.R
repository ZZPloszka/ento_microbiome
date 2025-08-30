# Load necessary libraries
library(vegan)
library(ggplot2)
library(ggrepel)
library(tibble)
library(dplyr)

# Read the data
Data <- read.delim('insect_data_log.txt', header=TRUE, sep="\t")


View(Data)



# Almost no bacteria have a normal distribution :)

# Check normality of one bacterial taxa at a time (repeat for others)
ggplot(Data, aes(x = Zotu9)) + 
  geom_histogram(bins = 30, fill = "blue", alpha = 0.6) +
  ggtitle("Distribution of Zotu9")
shapiro.test(Data$Zotu9)
# Low p value = non-normal data 

# Check normality of one bacterial taxa at a time (repeat for others)
ggplot(Data, aes(x = Zotu2)) + 
  geom_histogram(bins = 30, fill = "blue", alpha = 0.6) +
  ggtitle("Distribution of Zotu2")
shapiro.test(Data$Zotu2)
# Low p value = non-normal data 

# Check normality of one bacterial taxa at a time (repeat for others)
ggplot(Data, aes(x = Zotu1)) + 
  geom_histogram(bins = 30, fill = "blue", alpha = 0.6) +
  ggtitle("Distribution of Zotu1")
shapiro.test(Data$Zotu1)
# Low p value = non-normal data 

# Check normality of one bacterial taxa at a time (repeat for others)
ggplot(Data, aes(x = Zotu3)) + 
  geom_histogram(bins = 30, fill = "blue", alpha = 0.6) +
  ggtitle("Distribution of Zotu3")
shapiro.test(Data$Zotu3)
# Low p value = non-normal data 

# Check normality of one bacterial taxa at a time (repeat for others)
ggplot(Data, aes(x = Zotu5)) + 
  geom_histogram(bins = 30, fill = "blue", alpha = 0.6) +
  ggtitle("Distribution of Zotu5")
shapiro.test(Data$Zotu5)
# Low p value = non-normal data 




#Spearman test for every bacteria
results <- lapply(colnames(Data)[4:25], function(Zotu) {
  test <- cor.test(Data$ratio, Data[[Zotu]], method = "spearman", exact = FALSE)  # exact=FALSE for large samples
  data.frame(
    Bacterium = Zotu,
    Spearman_rho = test$estimate,
    p_value = test$p.value
  )
})
results_Data <- do.call(rbind, results)
results_Data$p_adj <- p.adjust(results_Data$p_value, method = "BH")  # Adjust for multiple testing
print(results_Data)



#Zotu9
cor.test(Data$ratio, Data$Zotu9, method = "spearman")
ggplot(Data, aes(ratio, Zotu9, color = sex)) + geom_point() + geom_smooth(method = "lm")

#Zotu2
cor.test(Data$ratio, Data$Zotu2, method = "spearman")
ggplot(Data, aes(ratio, Zotu2, color = sex)) + geom_point() + geom_smooth(method = "lm")

#Zotu1
cor.test(Data$ratio, Data$Zotu1, method = "spearman")
ggplot(Data, aes(ratio, Zotu1, color = sex)) + geom_point() + geom_smooth(method = "lm")

#Zotu3
cor.test(Data$ratio, Data$Zotu3, method = "spearman")
ggplot(Data, aes(ratio, Zotu3, color = sex)) + geom_point() + geom_smooth(method = "lm")

#Zotu5
cor.test(Data$ratio, Data$Zotu5, method = "spearman")
ggplot(Data, aes(ratio, Zotu5, color = sex)) + geom_point() + geom_smooth(method = "lm")

#Zotu6
cor.test(Data$ratio, Data$Zotu6, method = "spearman")
ggplot(Data, aes(ratio, Zotu6, color = sex)) + geom_point() + geom_smooth(method = "lm")

#Zotu28
cor.test(Data$ratio, Data$Zotu28, method = "spearman")
ggplot(Data, aes(ratio, Zotu28, color = sex)) + geom_point() + geom_smooth(method = "lm")

#Zotu15
cor.test(Data$ratio, Data$Zotu15, method = "spearman")
ggplot(Data, aes(ratio, Zotu15, color = sex)) + geom_point() + geom_smooth(method = "lm")

#Zotu12
cor.test(Data$ratio, Data$Zotu12, method = "spearman")
ggplot(Data, aes(ratio, Zotu12, color = sex)) + geom_point() + geom_smooth(method = "lm")

#Zotu23
cor.test(Data$ratio, Data$Zotu23, method = "spearman")
ggplot(Data, aes(ratio, Zotu23, color = sex)) + geom_point() + geom_smooth(method = "lm")
