library(dplyr)

MechaCar_data <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_data))
