# Deliverable 1
# Linear Regression to Predict MPG

# Load the required packages
require(tidyverse)
require(GGally)
require(mosaic)

# Import data
mecha_car = read.csv("MechaCar_mpg.csv", header = TRUE)

# Inspect the data
head(mecha_car)

# Plot the data
ggpairs(mecha_car)

# Create a linear regression model
model1 <-lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_car)

# Get value for regression model
summary(model1)


# Summary Statistics on Suspension Coils

# Load the required packages
require(diplyr)
require(mosaic)

# Import the data
suspension.coil = read.csv("Suspension_Coil.csv", header = TRUE)

# Inspect the data
head(suspension.coil)

# create a total_summary dataframe using the summarize()
# function to get the mean, median, variance, and sd
# of the suspension coil's PSI

PSI <- suspension.coil$"PSI"

total_summary<- favstats(PSI)
total_summary

# Group vehicles by manufacturing lot
# Then get the PSI summary statistics for each lot
lot_summary <- suspension.coil %>% group_by(Manufacturing_Lot) %>% 
                summarize(Mean = mean(PSI),
                          Median = median(PSI),
                          Variance = var(PSI),
                          SD = sd(PSI),
                          .groups = 'drop')
lot_summary

# Boxplot of PSI by Manufacturing Lot
boxplot(PSI ~ Manufacturing_Lot, data = suspension.coil, main = "Suspension Coil Data",
                xlab = "Manufacturing Lot", ylab = "Pounds per Square Inch")

# T-Tests on Suspension Coils

# Use the t.test() function to determine if the PSI across all manufacturing
# lots is statistically different from the population mean 
# of 1,500 pounds per square inch

t.test(suspension.coil$PSI, mu=1500)

# Use t.test() function 3 more times with subset()
# to determine if PSI for each manufacturing lot 
# is statistically different from the pop.mean of 1,500 PSI

Lot1 <- subset(suspension.coil, Manufacturing_Lot == "Lot1")
Lot2 <- subset(suspension.coil, Manufacturing_Lot == "Lot2")
Lot3 <- subset(suspension.coil, Manufacturing_Lot == "Lot3")

# Determine if the PSI for each manufacturing lot is statistically
# different from the population mean of 1,500 pounds per square inch
t.test(Lot1$PSI, mu=1500)
t.test(Lot2$PSI, mu=1500)
t.test(Lot3$PSI, mu=1500)

# Create a summary table showing the results from the previous t-tests
test.table <- matrix(c(1, 0.61, 0.041), ncol = 3, byrow = TRUE)
colnames(test.table) <- c('Lot 1', 'Lot 2', 'Lot 3')
rownames(test.table) <- c('p-value')
test.table <- as.table(test.table)
test.table
