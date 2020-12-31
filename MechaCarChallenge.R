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