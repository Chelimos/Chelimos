Sys.setenv(OCI_LIB64="C:/Oracle")
#install.packages("ROracle") 
library(ROracle)
drv <- dbDriver("Oracle") # define driver
odwp <- dbConnect(drv,"OUIRUSER","kxE4X2G+!!XrAAD32","ODWP")

dbListTables(odwp)

acad_pan <- dbReadTable(odwp,"D_ACAD_PLAN")

field_study <- dbReadTable(odwp,"CONV_L_FIELD_OF_STUDY")


head(acad_pan$TERM_CODE)
table(acad_pan$TERM_CODE)
library(tidyverse)
acad_plan_fall22 <- acad_pan %>% 
  filter(TERM_CODE == "20231C")

acad_plan_field22 <- left_join(acad_plan_fall22, field_study, by = "TERM_CODE")
