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
