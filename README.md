# Overview

## Resources
*Data: MechaCar.csv & Suspension_Coil.csv
*Software: R 4.2.2 & RStudio

## Linear Regression to Predict MPG
### Background
The "MechaCar_mpg.csv" dataset contains mpg test results for 50 prototype MechaCars. The MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. 
Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. Using your knowledge of R, you’ll design a linear model 
that predicts the mpg of MechaCar prototypes using several variables from the MechaCar_mpg.csv. 

### Analysis
Linear regression is used to estimate the slope of a line that will best fit the data
by looking at the relationship between a dependent variable and one or more independent variables. 

One of the main assumptions of linear regression is that values are statistically independent of one another.

Using the "GGAlly package" you can create a scatterplot matrix of each variable to assess how they are correlated with one another. 

![Scatterplotmatrix](https://github.com/CSoldo1/MechaCarChallenge/blob/main/Images/Multiple_Correlation_Plot.png)

### Results
![Results of Linear Regression](https://github.com/CSoldo1/MechaCarChallenge/blob/main/Images/Linear_regression_output.PNG)

Vehicle_length, Vehicle_weight, and Ground_Clearance are all non-random predictors of vehicle mpg, that is, they all meet
the p < 0.05 threshold. A negative intercept indicates that as the value of the independent variables increases, the value of y will decrease. Thus, 
as the length, weight, and ground clearance of a vehicle increases, the mpg performance of the car decreases. 

### Conclusion
A flaw of the multiple r2 value in linear regression is that it will always increase when a new independent variable is added to the model
even if it has little to no correlation with the dependent variable. Thus, when using linear regression models, one should stick with the 
principle of parsimony - we want the simplest model that adequately explains a phenomenon. Therefore, I would stick with vehicle_length and
ground_Clearance as the two variables that best predict a vehicle's mpg. 

## Create Visualizations for the Trip Analysis
### Background 
The MechaCar Suspension_Coil.csv dataset contains the results from multiple production lots. In this dataset, 
the weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots. 

### Analysis
I used the "favstats" function located within the Mosaic package to get a total summary of the "PSI" column.
![Favstats Output](https://github.com/CSoldo1/MechaCarChallenge/blob/main/Images/favstats_output.PNG)

I prefer to use the "favstats" function instead of "summarize()" because it includes more information, such as
min, max, and population(n). It also lets you know if there are any missing values in the column. The one measure it does not 
provide that is included in the "summarize()" function is variance. However, you can easily calculate this measurement 
by squaring the standard deviation. 

I then grouped the suspension coils by the lot on which it was manufactured, to see if there is any differences in PSI based
on manufacturing location. 

### Results
![Lot Summary Overview](https://github.com/CSoldo1/MechaCarChallenge/blob/main/Images/lot_summary_overview.PNG)

### Conclusion
The mean PSI of Lot 3 is a little lower than the other two lots. The variance, on the other hand, is much higher. This discrepency 
is cause for concern and requires further evaluation. 

## T-Tests on Suspension Coils
### Background
Using R, I performed t-tests to determine if all manufacturing lots and each lot individually
are statistically different from the population mean of 1,500 pounds per square inch.

### Analysis
Before performing t-tests, I think it's best to get a veiw of the data. Boxplots are a good way to see
the spread of the data.
![PSI box Plot](https://github.com/CSoldo1/MechaCarChallenge/blob/main/Images/Lot_PSI_Boxplot.png)

Already, we can see that there are a lot of outliers in Lot 3.

### Results
The mean of all the manufacturing lots is not statistically different from the population mean. In other words,
our p-value is greater than our threshold of 0.05. 
![T-test Output](https://github.com/CSoldo1/MechaCarChallenge/blob/main/Images/t-test_output.PNG)

However, the results of the individual lot t-tests tells a different story. For convenience,
I combined the results of the t-test for each lot into a dataframe. 
![T-test P-values](https://github.com/CSoldo1/MechaCarChallenge/blob/main/Images/ttest_pvalues.PNG)

### Conclusion
Lot 3 had a p-value of 0.041, and therefore, its mean PSI is significantly different from the population mean. 

## Study Design: MechaCar vs Competition
### Background
Write a short description of a statistical study that can quantify how the MechaCar performs against the competition. 
In your study design, think critically about what metrics would be of interest to a consumer: 
for a few examples, cost, city or highway fuel efficiency, horse power, maintenance cost, or safety rating.

Overview: Vehicle safety is an important consideration for customers. 

Question: Does MechaCar produce safer vehicles than the competition? 

Null Hypothesis: There is no difference in overall safety rating between MechaCar and its competition.
Alternative Hypothesis: On average, MechaCar vehicles receive higher safety ratings than the competition. 

Study Design: Make sure to pick a competitor that manufactures similar vehicle models to MechaCar. Collect safety ratings for all company models manufactured in 2023. Get the average safety rating (or safety rating of the population)
for each make. 

Statistical Test: Perform a t-test to see if MechCar vehicle safety ratings, on average, are statistically different from the competition. 
