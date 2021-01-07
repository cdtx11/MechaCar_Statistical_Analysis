library(dplyr)

#read in mechacar data
MechaCar_data <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

#create linear regression model and use summary() to get pvalues
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_data))

#read in suspension data
suspension_data <- read.csv('Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

#create total summary dataframe for PSI
total_summary <- suspension_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#create summary dataframe grouped by lot number
lot_Summary <- suspension_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#t test for deliverable 3 pt 1
#see if PSI is statistically different from pop mean of 1500
t.test(suspension_data$PSI, mu=1500)

#deliverable 3 pt 2 determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 psi
t.test(subset(suspension_data$PSI,suspension_data$Manufacturing_Lot=='Lot1'),mu=1500)
t.test(subset(suspension_data$PSI,suspension_data$Manufacturing_Lot=='Lot2'),mu=1500)
t.test(subset(suspension_data$PSI,suspension_data$Manufacturing_Lot=='Lot3'),mu=1500)
