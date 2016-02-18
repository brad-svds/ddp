# Load required libraries
require(data.table)
library(dplyr)
library(DT)
library(graphics)
library(rCharts)

# Read data
data <- fread("borough_grad_rates.csv")
colnames(data) <- make.names(colnames(data))

#Chart #1
groupByCohort <- function(data, minYear, maxYear, borough) {
  result <- data %>% filter(Cohort >= minYear, Cohort <= maxYear,
                          Borough %in% borough, All == "Total") 
  return(result)
}

plotCohortByYear <- function(data, dom = "CohortByYear", 
                             xAxisLabel = "Year",
                             yAxisLabel = "Graduation Rate") {
  CohortByYear <- nPlot(
    Total.Grads.....of.cohort ~ Cohort, group = "Borough",
    data = data,
    type = "multiBarChart",
    dom = dom, width = 650
  )
  CohortByYear$chart(margin = list(left = 100))
  CohortByYear$chart(color = c("red", "green", "blue", "cyan", "magenta"))
  CohortByYear$yAxis(axisLabel = yAxisLabel, width = 80)
  CohortByYear$xAxis(axisLabel = xAxisLabel, width = 70)
  CohortByYear$chart(showControls = FALSE)
  CohortByYear 
}

#Chart #2
 ELLgroupByYear <- function(data, minYear, maxYear, ELL, borough) {
   result <- data %>% filter(Cohort >= minYear, Cohort <= maxYear, Demographic %in% ELL,
                             Borough %in% borough) 
   return(result)
 }

plotELLByYear <- function(data, dom = "ELLByYear", 
                    xAxisLabel = "Year",
                    yAxisLabel = "Graduation Rate") {
      ELLByYear <- nPlot(
          Total.Grads.....of.cohort ~ Cohort, group = "Borough",
          data = data,
          type = "multiBarChart",
          dom = dom, width = 650
   )
      ELLByYear$chart(margin = list(left = 100))
      ELLByYear$chart(color = c("red", "green", "blue", "cyan", "magenta"))
      ELLByYear$yAxis(axisLabel = yAxisLabel, width = 80)
      ELLByYear$xAxis(axisLabel = xAxisLabel, width = 70)
      ELLByYear$chart(showControls = FALSE)
      ELLByYear 
                           }
 
 #Chart #3
 EDgroupByYear <- function(data, minYear, maxYear, ED, borough) {
   result <- data %>% filter(Cohort >= minYear, Cohort <= maxYear, Demographic %in% ED,
                             Borough %in% borough) 
   return(result)
 }
 
 plotEDByYear <- function(data, dom = "EDByYear", 
                           xAxisLabel = "Year",
                           yAxisLabel = "Graduation Rate") {
   EDByYear <- nPlot(
     Total.Grads.....of.cohort ~ Cohort, group = "Borough",
     data = data,
     dom = dom,
     type = "multiBarChart",
     width = 650
   )
   EDByYear$chart(margin = list(left = 100))
   EDByYear$chart(color = c("red", "green", "blue", "cyan", "magenta"))
   EDByYear$yAxis(axisLabel = yAxisLabel, width = 80)
   EDByYear$xAxis(axisLabel = xAxisLabel, width = 70)
   EDByYear$chart(showControls = FALSE)
   EDByYear 
 }

 #Chart #4
 RacegroupByYear <- function(data, minYear, maxYear, race, borough) {
   result <- data %>% filter(Cohort >= minYear, Cohort <= maxYear, Demographic %in% race,
                             Borough %in% borough) 
   return(result)
 }
 
 plotRaceByYear <- function(data, dom = "RaceByYear",  
                          xAxisLabel = "Year",
                          yAxisLabel = "Graduation Rate") {
   RaceByYear <- nPlot(
     Total.Grads.....of.cohort ~ Cohort, group = "Borough",
     data = data,
     dom = dom,
     type = "multiBarChart",
     width = 650
   )
   RaceByYear$chart(margin = list(left = 100))
   RaceByYear$chart(color = c("red", "green", "blue", "cyan", "magenta"))
   RaceByYear$yAxis(axisLabel = yAxisLabel, width = 80)
   RaceByYear$xAxis(axisLabel = xAxisLabel, width = 70)
   RaceByYear$chart(showControls = FALSE)
   RaceByYear 
 }
 
 #Chart #5
 GendergroupByYear <- function(data, minYear, maxYear, gender, borough) {
   result <- data %>% filter(Cohort >= minYear, Cohort <= maxYear, Demographic %in% gender,
                             Borough %in% borough) 
   return(result)
 }
 
 plotGenderByYear <- function(data, dom = "GenderByYear", 
                            xAxisLabel = "Year",
                            yAxisLabel = "Graduation Rate") {
   GenderByYear <- nPlot(
     Total.Grads.....of.cohort ~ Cohort, group = "Borough",
     data = data,
     dom = dom,
     type = "multiBarChart",
     width = 650
   )
   GenderByYear$chart(margin = list(left = 100))
   GenderByYear$chart(color = c("red", "green", "blue", "cyan", "magenta"))
   GenderByYear$yAxis(axisLabel = yAxisLabel, width = 80)
   GenderByYear$xAxis(axisLabel = xAxisLabel, width = 70)
   GenderByYear$chart(showControls = FALSE)
   GenderByYear 
 }
