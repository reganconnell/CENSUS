# Required Libraries
library(faraway)
library(ggplot2) # Graphics
library(MASS) # Stepwise Regression
library(leaps) # all-subsets regression

# Load from csv file
path<-"/Users/reganconnell/Desktop/urap/data/R11886399_SL040.csv"
states_2016<- read.csv(file=path, header=TRUE, sep=",") 

POPDEN <- states_2016$SE_T002_002
POPULATION <- states_2016$SE_T002_001

HOUSEHOLDS <- states_2016$ACS16_5yr_B25001001
HOUSEHOLDSSE <- states_2016$ACS16_5yr_B25001001s
HOUSEHOLDSMAX <- HOUSEHOLDS + HOUSEHOLDSSE
HOUSEHOLDSMIN <- HOUSEHOLDS -HOUSEHOLDSSE

HHSIZE <- states_2016$ACS16_5yr_B25010001
HHSIZESE <- states_2016$ACS16_5yr_B25010001s
HHSIZEMAX <- HHSIZE + HHSIZESE
HHSIZEMIN <- HHSIZE - HHSIZESE


AVGINCOME <- (((states_2016$ACS16_5yr_B19001002 * 8000) + (states_2016$ACS16_5yr_B19001003 * 12500) + (states_2016$ACS16_5yr_B19001004 * 17500) + (states_2016$ACS16_5yr_B19001005 * 22500) 
               + (states_2016$ACS16_5yr_B19001006 * 27500) + (states_2016$ACS16_5yr_B19001007 * 32500) + (states_2016$ACS16_5yr_B19001008 * 37500) + (states_2016$ACS16_5yr_B19001009 * 42500) 
               + (states_2016$ACS16_5yr_B19001010 * 47500) + (states_2016$ACS16_5yr_B19001011 *55500) + (states_2016$ACS16_5yr_B19001012 * 67500) + (states_2016$ACS16_5yr_B19001013 * 87500) +
                 (states_2016$ACS16_5yr_B19001014 * 112500) + (states_2016$ACS16_5yr_B19001015 * 137500) +(states_2016$ACS16_5yr_B19001016 * 175000) +(states_2016$ACS16_5yr_B19001017 * 250000))/(states_2016$ACS16_5yr_B19001001))
AVGINCOMESE_ADD <- (sqrt((states_2016$ACS16_5yr_B19001002s)^2 + (states_2016$ACS16_5yr_B19001003s)^2 + (states_2016$ACS16_5yr_B19001004s)^2 + 
                           (states_2016$ACS16_5yr_B19001005s)^2 + (states_2016$ACS16_5yr_B19001006s)^2 + (states_2016$ACS16_5yr_B19001007s)^2 + 
                           (states_2016$ACS16_5yr_B19001008s)^2 + (states_2016$ACS16_5yr_B19001009s)^2 + (states_2016$ACS16_5yr_B19001010s)^2 + 
                           (states_2016$ACS16_5yr_B19001011s)^2 + (states_2016$ACS16_5yr_B19001012s)^2 + (states_2016$ACS16_5yr_B19001013s)^2 + 
                           (states_2016$ACS16_5yr_B19001014s)^2 + (states_2016$ACS16_5yr_B19001015s)^2 + (states_2016$ACS16_5yr_B19001016s)^2 + 
                           (states_2016$ACS16_5yr_B19001017s)^2))

AVGINCOMESE <- ((sqrt((AVGINCOMESE_ADD/(AVGINCOME*states_2016$ACS16_5yr_B19001001))^2 + (states_2016$ACS16_5yr_B19001001s/states_2016$ACS16_5yr_B19001001)^2)*states_2016$ACS16_5yr_B19001001))


EDUCATION <- (states_2016$ACS16_5yr_B15003022 + states_2016$ACS16_5yr_B15003023 + states_2016$ACS16_5yr_B15003024 + states_2016$ACS16_5yr_B15003025) / states_2016$ACS16_5yr_B15003001

EDUCATIONSE <-
  

df <- data.frame(POPDEN, POPULATION, HOUSEHOLDS, HOUSEHOLDSSE, HOUSEHOLDSMAX, HOUSEHOLDSMIN,
                 HHSIZE, HHSIZESE, HHSIZEMAX, HHSIZEMIN, AVGINCOME, AVGINCOMESE, EDUCATION)

df 
